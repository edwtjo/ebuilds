
EAPI=3

DESCRIPTION="rebar is an Erlang build tool which simplifies compilation and
testing"

HOMEPAGE="https://github.com/basho/rebar"
SRC_URI="https://github.com/basho/rebar/tarball/RELEASE-1 -> $PN-$PV.tar.gz"

TAG_HASH="2f1d415"
S="$WORKDIR/basho-$PN-$TAG_HASH"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=">=dev-lang/erlang-13.2.4"
RDEPEND="${DEPEND}"

src_compile() {
	./bootstrap
}

src_install() {
	mkdir -p ${D}/usr/bin
	cp ${S}/rebar ${D}/usr/bin/.
}

