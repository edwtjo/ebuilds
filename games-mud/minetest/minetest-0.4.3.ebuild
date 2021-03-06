# Distributed under the terms of the GNU General Public License v2

EAPI=4
inherit eutils cmake-utils gnome2-utils vcs-snapshot user games

DESCRIPTION="An InfiniMiner/Minecraft inspired game"
HOMEPAGE="http://c55.me/minetest/"
SRC_URI="http://github.com/celeron55/minetest/tarball/${PV} -> ${P}.tar.gz"

LICENSE="LGPL-2.1+ CCPL-Attribution-ShareAlike-3.0"
SLOT="0"
KEYWORDS="~*"
IUSE="dedicated nls +server"

RDEPEND="dev-db/sqlite:3
	dev-lang/lua
	=dev-libs/jthread-1.2.1-r1
	sys-libs/zlib
	!dedicated? (
		app-arch/bzip2
		media-libs/libogg
		media-libs/libpng:0
		media-libs/libvorbis
		media-libs/openal
		virtual/jpeg
		virtual/opengl
		x11-libs/libX11
		x11-libs/libXxf86vm
	)
	nls? ( virtual/libintl )"

DEPEND="${RDEPEND}
	>=dev-games/irrlicht-1.7
	nls? ( sys-devel/gettext )"

pkg_setup() {
	games_pkg_setup

	if use server || use dedicated ; then
		enewuser ${PN} -1 -1 /var/lib/${PN} ${GAMES_GROUP}
	fi
}

src_unpack() {
	vcs-snapshot_src_unpack
}

src_prepare() {
	epatch \
		"${FILESDIR}"/${P}-jthread.patch \
		"${FILESDIR}"/${P}-lua.patch

	rm -r src/{jthread,lua,sqlite} || die

	# set paths
	sed \
		-e "s#@BINDIR@#${GAMES_BINDIR}#g" \
		-e "s#@GROUP@#${GAMES_GROUP}#g" \
		"${FILESDIR}"/minetestserver.conf > "${T}"/minetestserver.conf || die
}

src_configure() {
	local mycmakeargs=(
		-DRUN_IN_PLACE=0
		-DCUSTOM_SHAREDIR="${GAMES_DATADIR}/${PN}"
		-DCUSTOM_BINDIR="${GAMES_BINDIR}"
		-DCUSTOM_DOCDIR="/usr/share/doc/${PF}"
		$(usex dedicated "-DBUILD_SERVER=ON -DBUILD_CLIENT=OFF" "$(cmake-utils_use_build server SERVER) -DBUILD_CLIENT=ON")
		$(cmake-utils_use_enable nls GETTEXT)
		)

	cmake-utils_src_configure
}

src_compile() {
	cmake-utils_src_compile
}

src_install() {
	cmake-utils_src_install

	if use server || use dedicated ; then
		newinitd "${FILESDIR}"/minetestserver.init minetestd
		newconfd "${T}"/minetestserver.conf minetestd
	fi

	prepgamesdirs
}

pkg_preinst() {
	games_pkg_preinst
	gnome2_icon_savelist
}

pkg_postinst() {
	games_pkg_postinst
	gnome2_icon_cache_update

	if ! use dedicated ; then
		elog
		elog "optional dependencies:"
		elog "	games-mud/minetest-mod (official mod)"
		elog
	fi

	if use server || use dedicated ; then
		elog
		elog "Configure your server via /etc/conf.d/minetestd"
		elog "The user \"minetest\" is created with /var/lib/${PN} homedir."
		elog
	fi
}

pkg_postrm() {
	gnome2_icon_cache_update
}
