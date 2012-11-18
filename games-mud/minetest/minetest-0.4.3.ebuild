# Distributed under the terms of the GNU General Public License v2

EAPI=4

inherit eutils games cmake-utils vcs-snapshot user

DESCRIPTION="An InfiniMiner/Minecraft inspired game."
HOMEPAGE="http://celeron.55.lt/~celeron55/minetest/"
SRC_URI="https://github.com/celeron55/minetest/tarball/${MY_PV} -> ${MY_P}.tar.gz"

TAG_HASH="bc0e5c0"

S="${WORKDIR}/celeron55-minetest-$TAG_HASH"

LICENSE="LGPL-2.1+ CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~*"
IUSE="+client nls +server"

DEPEND="sys-libs/zlib
		nls? ( sys-devel/gettext )
		>=dev-games/irrlicht-1.7
		x11-libs/libX11
		virtual/opengl
		app-arch/bzip2
		media-libs/libpng
		dev-db/sqlite:3
		>=dev-libs/jthread-1.2
		"
RDEPEND="${DEPEND}"

src_unpack() {
	vcs-snapshot_src_unpack
}

src_configure() {
	# we redesignate installation paths to the games prefix and
	# intentionally break project supplied jthread and sqlite source
	sed -i -e "s|set(BINDIR \"bin|set(BINDIR \"games/bin|g" \
		-e "s|set(DATADIR \"share/|set(DATADIR \"share/games/|g" \
		-e "/^if (SQLITE/,/^endif (SQLITE/d" \
		-e "/^if (JTHREAD/,/^endif (JTHREAD/d" \
		CMakeLists.txt || die "games prefix paths not reset"

	# we also need to redesignate the language file location since
	# it shouldn't live in /usr/share/games/locale..
	sed -i -e \
	"s|GETTEXT_MO_DEST_PATH \${DATADIR}/|GETTEXT_MO_DEST_PATH \${DATADIR}/../|g" \
		cmake/Modules/FindGettextLib.cmake || die "locale path not reset"

	mycmakeargs="
		-DRUN_IN_PLACE=0
		-DJTHREAD_INCLUDE_DIR=${EROOT}/usr/include/jthread
		$(cmake-utils_use_build client CLIENT)
		$(cmake-utils_use_build server SERVER)
		$(cmake-utils_use_use nls GETTEXT)"

	cmake-utils_src_configure
}

src_prepare() {
	# these should not be used during building anyway so we delete them
	rm -rf src/{jthread,sqlite}
	# default texture path reset to games prefix
	epatch "${FILESDIR}"/fix-texture-path-$MY_PV.patch
}

src_install() {
	cmake-utils_src_install

	if use server; then
		newinitd "${FILESDIR}/minetestserver.initd" minetestd
		newconfd "${FILESDIR}/minetestserver.conf" minetestd
	fi
}

pkg_preinst() {
	enewgroup minetest
	enewuser minetest -1 -1 /var/lib/minetest "minetest,games"
	mkdir -p ${D}/var/lib/minetest
	chown minetest:minetest ${D}/var/lib/minetest
}

