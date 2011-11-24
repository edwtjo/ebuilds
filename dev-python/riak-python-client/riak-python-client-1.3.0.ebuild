EAPI=3

inherit eutils distutils

DESCRIPTION="An interactive regular expression tester"
HOMEPAGE="http://thonpy.com/machette/"

SRC_URI="https://github.com/basho/riak-python-client/tarball/$P -> $P.tar.gz"

TAG_HASH="986f6e0"

S="$WORKDIR/basho-$PN-$TAG_HASH"

LICENSE="Apache-2.0"
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

