# Copyright 1999-2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="Linux driver for the Xbox One wireless dongle"
HOMEPAGE="https://github.com/medusalix/xow"
LICENSE="GPL-2"
SLOT="0"

EGIT_REPO_URI="https://github.com/medusalix/xow.git"
EGIT_BRANCH="master"
SRC_URI="http://download.windowsupdate.com/c/msdownload/update/driver/drvs/2017/07/1cd6a87c-623f-4407-a52d-c31be49e925c_e19f60808bdcbfbd3c3df6be3e71ffc52e43261e.cab -> driver.cab"
KEYWORDS=""

IUSE=""

RDEPEND="virtual/libusb:*"
DEPEND="${RDEPEND}"

PATCHES="${FILESDIR}/${P}-nodownload.patch"

src_compile() {
	if [ -f Makefile ] || [ -f GNUmakefile ] || [ -f makefile ]; then
		cp "${DISTDIR}/driver.cab" "${WORKDIR}/${P}/driver.cab"
		emake BUILD=RELEASE || die "emake failed"
	fi
}
src_install() {
	if [[ -f Makefile ]] || [[ -f GNUmakefile ]] || [[ -f makefile ]] ; then
		emake DESTDIR="${D}" PREFIX="" BINDIR="/sbin" UDEVDIR="/lib/udev/rules.d" SYSDDIR="/lib/systemd/system" install
	fi
	einstalldocs
}
