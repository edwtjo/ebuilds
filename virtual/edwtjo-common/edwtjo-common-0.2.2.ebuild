# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

DESCRIPTION="edwtjo's common packages and configurations for all setups"
HOMEPAGE="http://edwtjo.me"
SRC_URI=""

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""
DEPEND="
		app-admin/eselect-maven
		app-admin/syslog-ng
		app-admin/sudo
		app-arch/alien
		app-arch/bzip2
		app-arch/cpio
		app-arch/deb2targz
		app-arch/p7zip
		app-arch/unace
		app-arch/unzip
		app-arch/tar
		app-backup/duplicity
		app-editors/vim
		app-misc/mc
		app-misc/screen
		app-misc/rlwrap
		app-portage/eix
		app-portage/gentoolkit
		app-portage/layman
		app-shells/bash
		app-shells/zsh
		app-shells/zsh-completion
		app-text/dictd
		app-text/texlive
		dev-java/sun-jdk
		dev-java/maven-bin
		dev-java/java-config
		dev-util/lafilefixer
		dev-util/strace
		dev-vcs/git
		dev-vcs/subversion
		dev-vcs/mercurial
		media-gfx/imagemagick
		net-analyzer/ettercap
		net-analyzer/metasploit
		net-analyzer/netcat
		net-analyzer/netselect
		net-analyzer/tptest
		net-analyzer/wireshark
		net-analyzer/traceroute
		net-dns/libidn
		net-ftp/lftp
		net-misc/iputils
		net-misc/dhcpcd
		net-misc/openntpd
		net-misc/openssh
		net-misc/openvpn
		net-misc/rsync
		net-misc/telnet-bsd
		net-misc/unison
		net-misc/wget
		sys-apps/ack
		sys-apps/baselayout
		sys-apps/busybox
		sys-apps/coreutils
		sys-apps/diffutils
		sys-apps/file
		sys-apps/findutils
		sys-apps/hal
		sys-apps/gawk
		sys-apps/grep
		sys-apps/iproute2
		sys-apps/kbd
		sys-apps/man-pages
		sys-apps/man-pages-posix
		sys-apps/net-tools
		sys-apps/openrc
		sys-apps/pciutils
		sys-apps/sed
		sys-apps/shadow
		sys-apps/slocate
		sys-apps/texinfo
		sys-apps/which
		sys-boot/grub
		sys-devel/automake
		sys-devel/bc
		sys-devel/binutils
		sys-devel/bison
		sys-devel/flex
		sys-devel/gcc
		sys-devel/gnuconfig
		sys-devel/m4
		sys-devel/make
		sys-devel/libtool
		sys-devel/llvm
		sys-devel/patch
		sys-fs/cryptsetup
		sys-fs/e2fsprogs
		sys-fs/lvm2
		sys-fs/mdadm
		sys-fs/udev
		sys-kernel/gentoo-sources
		sys-libs/gpm
		sys-libs/ncurses
		sys-libs/readline
		sys-libs/zlib
		sys-power/powertop
		sys-process/fcron
		sys-process/htop
		sys-process/iotop
		sys-process/procps
		virtual/edwtjo-hsbase
		dev-vcs/darcs
		virtual/editor
		virtual/pager"

RDEPEND="${DEPEND}"

pkg_setup() { :; }
src_unpack() { :; }
src_prepare() { :; }
src_compile() { :; }
src_install() { :; }
pkg_preinst() { :; }
pkg_postinst() { :; }

