EAPI=3

inherit eutils distutils

DESCRIPTION="An interactive regular expression tester"
HOMEPAGE="http://thonpy.com/machette/"

SRC_URI="http://download.thonpy.com/projects/machette/releases/0.3/machette-0.3.tar.gz"

S="$WORKDIR/$PN"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"

DEPEND="
dev-python/configobj
dev-python/docutils
		"
RDEPEND="${DEPEND}"

src_compile() {
	distutils_src_compile
}

src_install() {
	distutils_src_install
}

