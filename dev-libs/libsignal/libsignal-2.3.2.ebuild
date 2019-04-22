# Copyright 1999-2019 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3 cmake-utils flag-o-matic

DESCRIPTION="Signal Protocol C Library"
HOMEPAGE="https://github.com/signalapp/libsignal-protocol-c"
LICENSE="GPL-3"
SLOT="0"

EGIT_REPO_URI="https://github.com/signalapp/libsignal-protocol-c"
EGIT_BRANCH="master"
EGIT_COMMIT="4a137eaf4eb4421949e2e1dde9f11ec7bc07b88f"
SRC_URI=""
KEYWORDS="~amd64"

IUSE=""

RDEPEND=""
DEPEND="${RDEPEND}"

pkg_setup() {
	append-cflags $(test-flags-CC -fPIC)
	append-cxxflags $(test-flags-CXX -fPIC)
}
