# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="edwtjo's standard compliment of packages for server installations"
HOMEPAGE="http://edwtjo.me"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/edwtjo-common
		app-misc/uptimed
		app-admin/sshguard
		dev-lang/php
		dev-vcs/gitosis
		net-dns/dnsmasq
		net-dns/openresolv
		net-dns/unbound
		net-firewall/iptables
		net-irc/irssi
		net-news/newsbeuter
		www-apache/mod_fastcgi
		www-apache/mod_jk
		www-apache/mod_proxy_html
		www-apache/mod_scgi
		www-client/elinks
		www-servers/apache
		www-servers/tomcat
		dev-python/cheetah
		dev-python/pyopenssl
		"
RDEPEND="${DEPEND}"


pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }

