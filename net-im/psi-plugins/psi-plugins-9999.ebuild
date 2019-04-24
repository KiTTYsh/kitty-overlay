# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3 cmake-utils

DESCRIPTION="All Psi IM plugins except 3rd party ones"
HOMEPAGE="https://github.com/psi-im/plugins"
LICENSE="GPL-2"
SLOT="0"

EGIT_REPO_URI="https://github.com/psi-im/plugins"
EGIT_BRANCH="master"
SRC_URI=""
KEYWORDS=""

IUSE=""

RDEPEND="net-im/psi
dev-libs/libsignal
app-text/htmltidy"
DEPEND="${RDEPEND}"

src_install() {
	cmake-utils_src_install
	if has_version "net-im/psi[extras]"; then
		einfo "Psi+ detected, relocating plugins to psi-plus folder"
		mv "${D}/usr/lib"*"/psi" "${D}/usr/share/psi-plus"
	else
		mv "${D}/usr/lib"*"/psi" "${D}/usr/share/psi"
	fi
}
