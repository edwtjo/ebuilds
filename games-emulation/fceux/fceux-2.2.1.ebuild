
EAPI=4
inherit eutils scons-utils games

DESCRIPTION="A portable Famicom/NES emulator, an evolution of the original FCE Ultra"
HOMEPAGE="http://fceux.com/"
SRC_URI="https://sourceforge.net/projects/fceultra/files/Source%20Code/${PV}%20src/${P}.src.tar.gz/download -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="+lua +opengl"

RDEPEND="lua? ( dev-lang/lua )
	media-libs/libsdl[opengl?,video]
	opengl? ( virtual/opengl )
	x11-libs/gtk+:2
	<=sys-libs/zlib-1.2.5
	gnome-extra/zenity"
DEPEND="${RDEPEND}"

src_compile() {
	escons \
		CREATE_AVI=1 \
		$(use_scons opengl OPENGL) \
		$(use_scons lua LUA)
}

src_install() {
	dogamesbin bin/fceux

	doman documentation/fceux.6
	docompress -x /usr/share/doc/${PF}/documentation
	docompress -x /usr/share/doc/${PF}/fceux.chm
	dodoc -r Authors.txt changelog.txt TODO-PROJECT bin/fceux.chm documentation
	rm -f "${D}/usr/share/doc/${PF}/documentation/fceux.6"

	prepgamesdirs
}
