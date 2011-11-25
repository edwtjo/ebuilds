EAPI=3

inherit eutils git scons-utils games

DESCRIPTION="Doom 3 GPL source release"
HOMEPAGE="https://github.com/TTimo/doom3.gpl"
ABI="x86"
EGIT_REPO_URI="git://github.com/TTimo/doom3.gpl.git"

SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="+client nls +server"

DEPEND="
dev-util/scons
dev-python/configobj
dev-python/docutils
		"
RDEPEND="${DEPEND}"

src_compile() {
	cd $S/neo
	export LIBPATH="/usr/lib32"
	export LD_LIBRARY_PATH="/usr/lib32/"
	sed -i -e "s|/usr/lib/libz.a|/usr/lib32/libz.so|" sys/scons/SConscript.curl
	sed -i -e "s|/usr/local/games/doom3|/usr/share/games/$PN|" framework/Licensee.h
	escons || die "compilation failed"
}

src_unpack() {
	git_src_unpack || die "Failed to unpack repo"
}

src_install() {
	newgamesbin $S/neo/doom.x86 $PN || die "Failed to install executable"
	dogameslib.so $S/neo/gamex86-base.so || die "Failed to install library"
	dogameslib.so $S/neo/gamex86-d3xp.so || die "Failed to install library"
	insinto "$GAMES_DATADIR"/$PN
	doins -r $S/base || die "Failed to install basedir"
	insinto "$GAMES_DATADIR/$PN/base"
	doins $FILESDIR/default.cfg || die "Failed to install default configuration"
	prepgamesdirs
}

pkg_postinst() {
	einfo ""
	einfo "Remember that the game data files are still covered"
	einfo "by the original EULA."
	einfo "Now copy the game distribution files to"
	einfo "		/usr/share/games/$PN/base"
	einfo "and then run '$PN'"
	einfo ""
	games_pkg_postinst
}

