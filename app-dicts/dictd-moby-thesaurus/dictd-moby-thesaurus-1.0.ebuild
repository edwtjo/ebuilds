
EAPI=3

MY_P=dict-moby-thesaurus
DEB="${MY_P}_${PV}-6.2_all.deb"
S=${WORKDIR}
SRC_URI="http://ftp.se.debian.org/debian/pool/main/d/${MY_P}/${DEB}"
HOMEPAGE="http://www.dcs.shef.ac.uk/research/ilash/Moby/ http://packages.debian.org/unstable/text/dict-moby-thesaurus"
DESCRIPTION="Grady Ward's Moby Thesaurus; 35000 root words and 2.5 million synonyms"

DEPEND=">=app-text/dictd-1.5.5"

SLOT="0"
LICENSE="GPL-2"
KEYWORDS="x86 ~ppc ~sparc ~amd64"

src_unpack () {
	echo $WORKDIR
	ar xv /usr/portage/distfiles/${DEB} || die "failed to unpack .deb file"
	tar xvzf data.tar.gz || die "failed to unpack data.tar.gz inside .deb file"
}


src_install () {
	dodoc usr/share/doc/dict-moby-thesaurus/*
	dodir /usr/lib/dict
	insinto /usr/lib/dict
	doins usr/share/dictd/*
}
