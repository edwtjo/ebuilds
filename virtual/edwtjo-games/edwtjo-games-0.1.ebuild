# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="edwtjo's games setup"
HOMEPAGE="http://edwtjo.me"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND="
		games-arcade/frozen-bubble
		games-arcade/xgalaga
		games-arcade/opentyrian
        games-board/ccgo
        games-board/xboard
        games-board/xfrisk
		games-engines/exult
		games-engines/frobtads
		games-engines/scummvm
		games-engines/scummvm-tools
		games-engines/stratagus
		games-engines/gemrb
		games-engines/gargoyle
		games-emulation/advancemame
		games-emulation/advancemenu
		games-emulation/atari800
		games-emulation/daphne
		games-emulation/desmume
		games-emulation/dosbox
		games-emulation/dgen-sdl
		games-emulation/emutos
		games-emulation/fceux
		games-emulation/gens
		games-emulation/gngb
		games-emulation/gngeo
		games-emulation/handy
		games-emulation/hugo
		games-emulation/lxdream
		games-emulation/mednafen
		games-emulation/mupen64plus
		games-emulation/neopocott
		games-emulation/nestopia
		games-emulation/pcsx
		games-emulation/pcsx2
		games-emulation/ps2emu-cddvdlinuz
		games-emulation/ps2emu-cdvdiso
		games-emulation/ps2emu-dev9null
		games-emulation/ps2emu-gssoft
		games-emulation/ps2emu-padxwin
		games-emulation/ps2emu-spu2null
		games-emulation/ps2emu-usbnull
		games-emulation/psemu-cdr
		games-emulation/psemu-cdriso
		games-emulation/psemu-eternalspu
		games-emulation/psemu-gpupetemesagl
		games-emulation/psemu-gpupetexgl2
		games-emulation/psemu-padjoy games-emulation/psemu-padxwin
		games-emulation/psemu-peopssoftgpu
		games-emulation/psemu-peopsspu
		games-emulation/psemu-spunull
		games-emulation/raine
		games-emulation/sdlmame
		games-emulation/snes9x
		games-emulation/stella
		games-emulation/virtualjaguar
		games-emulation/visualboyadvance
		games-emulation/xmess
		games-emulation/yabause
		games-strategy/freecol
		games-fps/openarena
		games-fps/sauerbraten
		games-strategy/0ad
		games-strategy/hedgewars
		games-fps/nexuiz
		games-strategy/openxcom
		games-strategy/freeorion
		games-strategy/ufo-ai
		games-strategy/ufo2000
		games-strategy/scorched3d
		games-fps/alienarena
		games-arcade/pacmanarena
		games-action/bzflag
		games-strategy/wesnoth
		games-strategy/freeciv
		games-simulation/lincity-ng
		games-simulation/micropolis
		games-action/openlierox
		games-simulation/openttd
		games-puzzle/pingus
		games-fps/tremulous
		games-strategy/unknown-horizons
		games-action/xpilot
		games-action/xpilot-ng
		games-strategy/warzone2100
		games-fps/doomsday
		games-fps/doomsday-resources
		games-fps/gzdoom
		games-fps/doom-data
		games-fps/freedoom
		games-mud/minetest
"

RDEPEND="${DEPEND}"

