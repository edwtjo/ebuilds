EAPI=3

inherit eutils git distutils

DESCRIPTION="An interactive regular expression tester"
HOMEPAGE="http://thonpy.com/machette/"

EGIT_REPO_URI="git://github.com/vbatoufflet/machette.git"

SRC_URI=""
S="${WORKDIR}/${PN}"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+client nls +server"

DEPEND="
dev-python/configobj
dev-python/docutils
		"
RDEPEND="${DEPEND}"

src_compile() {
	distutils_src_compile
}

src_unpack() {
	git_src_unpack
	cd $S
}

src_install() {
	distutils_src_install
}

