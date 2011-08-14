EAPI=3

inherit games cmake-utils git

DESCRIPTION="An InfiniMiner/Minecraft inspired game."
HOMEPAGE="http://celeron.55.lt/~celeron55/minetest/"

EGIT_REPO_URI="git://github.com/celeron55/minetest.git"

SRC_URI=""
S="${WORKDIR}/${PN}"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="sys-libs/zlib
		sys-devel/gettext
		dev-games/irrlicht
		x11-libs/libX11
		virtual/opengl
		app-arch/bzip2
		media-libs/libpng
		dev-db/sqlite
		"
RDEPEND="${DEPEND}"

src_configure() {
	sed -i -e "s|set(BINDIR \"bin|set(BINDIR \"games/bin|g" \
		-e "s|set(DATADIR \"share/|set(DATADIR \"share/games/|g" \
		CMakeLists.txt || die "could not redesignate paths"
	cmake-utils_src_configure
}

src_unpack() {
	git_src_unpack
}

