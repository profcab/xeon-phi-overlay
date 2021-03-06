# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit rpm intel-mpss

DESCRIPTION="SDK for Intel Xeon Phi."
HOMEPAGE=${MPSS_URI}
SRC_URI=${MPSS_LINUX_SRC_URI}

LICENSE="Intel-MPSS"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="sys-libs/ncurses:5"	# k1om-mpss-linux-gdb is linked to ncurses 5

S=${WORKDIR}

src_unpack () {
	unpack ${A}
	rpm_unpack ./mpss-${PV}/${P}-1.x86_64.rpm
	rm -rf ./mpss-${PV}
}

src_install () {
	cp -r * "${D}"

	doenvd "${FILESDIR}/36mpss-sdk-k1om-${PV}"
}
