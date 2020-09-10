# Copyright 2020 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=7

inherit git-r3

DESCRIPTION="MSI fan profile control utility"
HOMEPAGE="https://github.com/YoyPa/isw"
SRC_URI=""

EGIT_REPO_URI="https://github.com/YoyPa/isw.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""

src_install() {
	dobin isw
	insinto /etc; doins etc/isw.conf
	insinto /etc/modprobe.d; doins etc/modprobe.d/isw-ec_sys.conf
	insinto /etc/modules-load.d; doins etc/modules-load.d/isw-ec_sys.conf
	insinto /lib/systemd/system; doins usr/lib/systemd/system/isw@.service
	einstalldocs
}
