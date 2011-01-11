# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit cvs eutils

#MY_P
DESCRIPTION="motion picture editing tool used for painting and retouching of movies"
HOMEPAGE="http://www.cinepaint.org/"
SRC_URI=""
ECVS_SERVER="cinepaint.cvs.sourceforge.net:/cvsroot/cinepaint"
ECVS_MODULE="cinepaint-project/cinepaint"
ECVS_BRANCH="HEAD"
ECVS_AUTH="pserver"
ECVS_USER="anonymous"
ECVS_PASS=""

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="debug gutenprint opengl oyranos png python test zlib"

RDEPEND="x11-libs/gtk+
	png? ( >=media-libs/libpng-1.2 )
	zlib? ( sys-libs/zlib )
	media-libs/openexr
	>=media-libs/lcms-1.16
	media-libs/tiff
	media-libs/jpeg
	x11-libs/fltk:1.1[opengl]
	x11-libs/libXmu
	x11-libs/libXinerama
	x11-libs/libXpm
	opengl? ( media-libs/ftgl )
	python? ( dev-lang/python )
	gutenprint? ( >=net-print/gutenprint-5.0.0 )
	oyranos? ( >=media-libs/oyranos-0.1.9 )"
DEPEND="${RDEPEND}
	dev-util/pkgconfig
	dev-vcs/cvs
	x11-proto/xineramaproto"

S=${WORKDIR}/${ECVS_MODULE}
RESTRICT=""

src_prepare() {
	epatch "${FILESDIR}/${P}-gcc43.patch"
	epatch "${FILESDIR}/${P}-multiple_parameters_named.patch"
	epatch "${FILESDIR}/${P}-implicitdecls.patch"
	epatch "${FILESDIR}/${P}-rpath.patch"
	einfo "running autogen.sh from cvs"
	chmod a+x ./autogen.sh || die "chmod a+x ./autogen.sh in ${S} failed"
	./autogen.sh || die "execution of ./autogen.sh in ${S} failed"
}

src_configure() {
	my_parms=""
	if has_version "x11-libs/gtk+:2" ; then
		my_parms="${my_parms} --enable-gtk2"
	else 
		my_parms="${my_parms} --disable-gtk2"
	fi
	if has_version "x11-libs/gtk+:1" ; then
		my_parms="${my_parms} --enable-gtk1"
	else 
		my_parms="${my_parms} --disable-gtk1"
	fi
	einfo "executig main ./configure"
	econf \
		$(use_enable debug) \
		$(use_enable gutenprint print) \
		$(use_enable python pygimp) \
		$(use_enable test gtktest) \
		${my_parms}
	cd plug-ins/icc_examin/icc_examin || die "configure failed"
	einfo "executing ./configure in plug-ins/icc_examin/icc_examin"
	LDFLAGS="" econf \
		$(use_enable debug)
}

src_compile() {
	MO=`echo -n ${MAKEOPTS} | sed -r "s:-j\s*[0-9]+:-j1:g"`
	einfo "no parallel make, MAKEOPTS changed from \"${MAKEOPTS}\" to \"${MO}\"."
	cd "${S}"/libhalf || die "emake compilation failed"
	MAKEOPTS="${MO}" emake DESTDIR="${D}" || die "emake compilation failed"
	cd "${S}"/lib || die "emake compilation failed"
	MAKEOPTS="${MO}" emake DESTDIR="${D}" || die "emake compilation failed"
	cd "${S}" || die "emake compilation failed"
	MAKEOPTS="${MO}" emake DESTDIR="${D}" || die "emake compilation failed"
}

src_install() {
	emake DESTDIR="${D}" install || die "emake install failed"
	dodoc AUTHORS BUGS NEWS README TODO tips.txt
}

