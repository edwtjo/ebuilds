# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="edwtjo's standard compliment of packages for file/media server installations"
HOMEPAGE="http://edwtjo.me"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="virtual/edwtjo-server
		media-libs/win32codecs
		media-libs/sdl-image
		media-video/mplayer
		media-video/vlc
		media-video/tsmuxer
		media-sound/audiotag
		media-sound/mpd
		media-sound/streamtranscoder
		media-video/ffmpeg
		media-video/x264-encoder
		net-fs/samba
		net-im/bitlbee
		net-p2p/rtorrent
		net-proxy/dante
		net-proxy/privoxy"

RDEPEND="${DEPEND}"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }

