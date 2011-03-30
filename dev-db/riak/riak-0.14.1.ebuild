# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

inherit base versionator eutils

MAJ_PV="$(get_major_version)"
MED_PV="$(get_version_component_range 2)"
MIN_PV="$(get_version_component_range 3)"

DESCRIPTION="An open source, highly scalable, schema-free document-oriented database"
HOMEPAGE="http://www.basho.com/"
SRC_URI="http://downloads.basho.com/${PN}/${PN}-${MAJ_PV}.${MED_PV}/${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="dev-lang/erlang"
DEPEND="${RDEPEND}"

PATCHES=()

RIAK_HOME="/var/lib/riak"

#pkg_postinst() { :; }
#src_unpack() { :; }
#src_prepare() { :; }
src_compile() {
	unset LDFLAGS
	emake rel || die "Compilation failed"
}
src_install() {
	mkdir -p ${D}/usr/bin || die "Couldn't create destination directory"
	mkdir -p ${D}/etc || die "Couldn't create destination directory"
	mkdir -p ${D}${RIAK_HOME} || die "Couldn't create destination directory"
	cp -R "${S}/rel/riak" "${D}/var/lib/." || die "Install failed!"
	dosym ${RIAK_HOME}/bin/riak /usr/bin/riak
	dosym ${RIAK_HOME}/bin/riak-admin /usr/bin/riak-admin
	dosym ${RIAK_HOME}/etc /etc/riak
}

pkg_preinst() {
	einfo "Adding riak:riak to system"
	enewgroup riak
	enewuser riak -1 -1 "/var/lib/riak" "riak"
}

pkg_postinst() {
	einfo "Creating riak K,V filesystem root"
	[ ! -d "${RIAK_HOME}" ] && mkdir -p ${RIAK_HOME}
	[ "`stat -c %U ${RIAK_HOME}`" != "riak" ] && chown riak:riak -R ${RIAK_HOME}
	[ "`stat -c %G ${RIAK_HOME}`" != "riak" ] && chown riak:riak -R ${RIAK_HOME}
	chmod 0700 -R ${RIAK_HOME}
}

pkg_postinst() {
	elog "You will need to configure riak in /etc/riak."
	elog "Specifically, you should give your node a unique name."
}

