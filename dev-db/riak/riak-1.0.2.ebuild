
EAPI=3

inherit base eutils

DESCRIPTION="An open source, highly scalable, schema-free document-oriented database"
HOMEPAGE="http://www.basho.com/"
SRC_URI="https://github.com/basho/riak/tarball/$PN-$PV -> $PN-$PV.tar.gz"

TAG_HASH="782cc74"

S="$WORKDIR/basho-$PN-$TAG_HASH"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND=">=dev-lang/erlang-13.2.4"
DEPEND="${RDEPEND} 
		>=dev-erlang/rebar-1"
PATCHES=()
RIAK_HOME="/var/lib/riak"

src_compile() {
	unset LDFLAGS
	emake rel || die "Compilation failed"
}

src_install() {
	mkdir -p ${D}${RIAK_HOME} || die "Couldn't create destination directory"
	mkdir -p ${D}/etc || die "Couldn't create destination directory"
	cp -R "${S}/rel/riak" "${D}/var/lib/." || die "Install failed!"
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
	find ${RIAK_HOME} -type d -exec chmod 0700 {} \;
	find ${RIAK_HOME} -type f -exec chmod 0600 {} \;
}

pkg_postinst() {
	elog "You will need to configure riak in /etc/riak/."
}

