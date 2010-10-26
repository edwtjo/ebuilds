# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="edwtjo's common haskell packages"
HOMEPAGE="http://edwtjo.me"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
		dev-lang/ghc
		app-admin/haskell-updater
		dev-haskell/mtl
		dev-haskell/network
		dev-haskell/parsec
		dev-haskell/network
		dev-haskell/opengl
		dev-haskell/x11
		dev-haskell/regex-base
		dev-haskell/regex-compat
		dev-haskell/regex-posix
		dev-haskell/stm
		dev-haskell/hunit
		dev-haskell/http
		dev-haskell/zlib
		dev-haskell/alex
		dev-haskell/alut
		dev-haskell/ansi-terminal
		dev-haskell/ansi-wl-pprint
		dev-haskell/binary
		dev-haskell/bzlib
		dev-haskell/cabal
		dev-haskell/cabal-install
		dev-haskell/cgi
		dev-haskell/cpphs
		dev-haskell/curl
		dev-haskell/dataenc
		dev-haskell/digest
		dev-haskell/drift
		dev-haskell/editline
		dev-haskell/fgl
		dev-haskell/frown
		dev-haskell/ghc-paths
		dev-haskell/glut
		dev-haskell/haddock
		dev-haskell/happy
		dev-haskell/harp
		dev-haskell/hashed-storage
		dev-haskell/haskeline
		dev-haskell/haskell-src
		dev-haskell/haskell-src-exts
		dev-haskell/hdoc
		dev-haskell/hinotify
		dev-haskell/hscolour
		dev-haskell/hslogger
		dev-haskell/html
		dev-haskell/iconv
		dev-haskell/json
		dev-haskell/language-c
		dev-haskell/missingh
		dev-haskell/mmap
		dev-haskell/openal
		dev-haskell/parallel
		dev-haskell/parsec
		dev-haskell/quickcheck
		dev-haskell/readline
		dev-haskell/terminfo
		dev-haskell/test-framework
		dev-haskell/test-framework-hunit
		dev-haskell/test-framework-quickcheck2
		dev-haskell/time
		dev-haskell/utf8-string
		dev-haskell/uulib
		dev-haskell/wxcore
		dev-haskell/wxdirect
		dev-haskell/wxhaskell
		dev-haskell/x11-xft
		dev-haskell/xhtml
		dev-haskell/zip-archive
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

