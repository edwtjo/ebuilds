# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="edwtjo's x11 haskell packages"
HOMEPAGE="http://edwtjo.me"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
		virtual/edwtjo-hsbase
		dev-haskell/opengl
		dev-haskell/x11
		dev-haskell/fgl
		dev-haskell/glut
		dev-haskell/wxcore
		dev-haskell/wxdirect
		dev-haskell/wxhaskell
		dev-haskell/x11-xft
"
RDEPEND="${DEPEND}"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() {
	haskell-updater
}

