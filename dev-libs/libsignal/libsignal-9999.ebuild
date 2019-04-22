# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils

DESCRIPTION="Signal Protocol C Library"
HOMEPAGE="https://github.com/signalapp/libsignal-protocol-c"
LICENSE="GPL-3"
SLOT="0"

EGIT_REPO_URI="https://github.com/signalapp/libsignal-protocol-c"
EGIT_BRANCH="master"
SRC_URI=""
KEYWORDS=""

IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

pkg_setup() {
	append-cflags $(test-flags-CC -fPIC)
	append-cxxflags $(test-flags-CXX -fPIC)
}
