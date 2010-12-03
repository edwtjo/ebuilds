# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="edwtjo's standard laptop setup"
HOMEPAGE="http://edwtjo.me"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
		virtual/edwtjo-x11
		games-engines/exult
		games-strategy/freecol
		games-strategy/wormux
		games-strategy/freeciv
		games-strategy/wesnoth
		media-video/guvcview
		media-video/luvcview
		net-wireless/iwl3945-ucode
		net-wireless/wpa_supplicant
		sys-apps/915resolution
		media-sound/jack-rack
		media-sound/qjackctl
		media-gfx/scantailor
"

RDEPEND="${DEPEND}"

