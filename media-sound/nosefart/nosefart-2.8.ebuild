
inherit eutils flag-o-matic

SRC_URI="mirror://sourceforge/${PN}/${P}-mls.tar.bz2"
DESCRIPTION="Nosefart NES format sound player"
HOMEPAGE="http://nosefart.sourceforge.net/"

RDEPEND=""
DEPEND="${RDEPEND}"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="~*"
S=${WORKDIR}/${P}-mls
src_compile() {
	emake || die
}

src_install() {
	make PREFIX="${D}" install || die
}
