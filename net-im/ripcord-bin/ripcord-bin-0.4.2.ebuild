# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit eutils gnome2-utils xdg-utils

DESCRIPTION="QT-based Discord/Slack Client"
HOMEPAGE="https://cancel.fm/ripcord/"
SRC_URI="https://cancel.fm/dl/Ripcord-${PV}-x86_64.AppImage"

LICENSE="freedist"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
RESTRICT="bindist"

DEPEND=""
RDEPEND="
	dev-libs/libffi
	dev-libs/libsodium:0/18
	dev-libs/openssl:0
	dev-qt/qtconcurrent:5
	dev-qt/qtgui:5
	dev-qt/qtimageformats:5
	dev-qt/qtmultimedia:5
	dev-qt/qtnetwork:5[ssl]
	dev-qt/qtsvg:5
	dev-qt/qtwebsockets:5
	media-libs/flac
	media-libs/freetype
	media-libs/mesa
	media-libs/opus:0
	media-libs/qt-gstreamer
	net-libs/libasyncns:0
	sys-apps/dbus
"

src_unpack() {
	mkdir "${S}"
	cp "${DISTDIR}/${A}" "${S}/"
	pushd "${S}"
	chmod +x ${A}
	"${S}/${A}" --appimage-extract Ripcord
	"${S}/${A}" --appimage-extract Ripcord.desktop
	"${S}/${A}" --appimage-extract Ripcord_Icon.png
	"${S}/${A}" --appimage-extract twemoji.ripdb
	popd
}

src_install() {
	dobin squashfs-root/Ripcord
	doicon -s 512 squashfs-root/Ripcord_Icon.png
	domenu squashfs-root/Ripcord.desktop
	insinto /usr; doins squashfs-root/twemoji.ripdb
}

pkg_postinst() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}

pkg_postrm() {
	gnome2_icon_cache_update
	xdg_desktop_database_update
}
