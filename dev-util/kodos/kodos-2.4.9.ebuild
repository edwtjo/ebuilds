
EAPI=3

inherit distutils eutils

DESCRIPTION="Kodos is a Python GUI utility for creating, testing and debugging regular expressions."
HOMEPAGE="http://kodos.sourceforge.net/"
SRC_URI="mirror://sourceforge/kodos/${P}.tar.gz"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~amd64 ~ppc ~sparc ~x86"
IUSE=""

DEPEND=">=dev-python/PyQt4-4.8"
RDEPEND="${DEPEND}"

src_install() {
	distutils_src_install
	cd "${D}"/usr/bin
	dosym kodos.py /usr/bin/kodos
}
