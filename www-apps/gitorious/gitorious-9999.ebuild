
EAPI=4

inherit git

DESCRIPTION="Gitorious aims to provide a great way of doing distributed opensource code collaboration."

HOMEPAGE="http://gitorious.org/gitorious"
LICENSE="AGPLv3"
SLOT="0"
KEYWORDS="~*"

EGIT_REPO_URI="git://gitorious.org/gitorious/mainline.git"

DEST_DIR="/usr/share/webapps/gitorious"

USER="git"

DRIVERS_IUSE="postgres mysql"
REQUIRED_USE="^^ ( ${DIVERS_IUSE//+} )"
IUSE="$DRIVERS_IUSE"

DEPEND=">=dev-vcs/git-1.6.4.4
	dev-ruby/stompserver
	>=dev-lang/ruby-1.8.7[threads]
	>=app-misc/sphinx-0.9.8
	dev-ruby/bundler
	>=www-servers/nginx-0.7.65-r1[nginx_modules_http_proxy,nginx_modules_http_rewrite,nginx_modules_http_gzip]
	>=net-misc/memcached-1.4.1
	mysql? ( >=dev-db/mysql-5.0 )	
	postgres? ( >=dev-db/postgresql-server-9 )"
RDEPEND="${DEPEND}"

src_unpack() {
	git_src_unpack
}

src_install() {
	insinto "${DEST_DIR}"
	doins -r .
}
