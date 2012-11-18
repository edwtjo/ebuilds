
EAPI=3

MY_P=dict-moby-thesaurus
DEB="${MY_P}_${PV}-6.2_all.deb"
S=${WORKDIR}
SRC_URI="http://ftp.debian.org/debian/pool/main/d/${MY_P}/${DEB}"
HOMEPAGE="http://www.dcs.shef.ac.uk/research/ilash/Moby/ http://packages.debian.org/unstable/text/dict-moby-thesaurus"
DESCRIPTION="Grady Ward's Moby Thesaurus; 35000 root words and 2.5 million synonyms"

RDEPEND="app-text/dictd"

SLOT="0"
LICENSE="Public Domain"

src_unpack () {
	ar xv /usr/portage/distfiles/${DEB} || die "failed to unpack .deb file"
	tar xvzf data.tar.gz || die "failed to unpack data.tar.gz inside .deb file"
}


src_install () {
	dodoc usr/share/doc/dict-moby-thesaurus/*
	dodir /usr/lib/dict
	insinto /usr/lib/dict
	doins usr/share/dictd/*
}
