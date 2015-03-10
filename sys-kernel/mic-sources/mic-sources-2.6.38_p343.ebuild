# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
K_DEBLOB_AVAILABLE="1"
ETYPE="sources"
inherit kernel-2
detect_version

DESCRIPTION="Full sources for the Linux kernel for the Xeon Phi card"
SRC_URI="http://registrationcenter.intel.com/irc_nas/6253/mpss-src-3.4.3.tar"

KEYWORDS="~amd64"
IUSE="deblob"

MPSS_VER=${PV#*_p}
MPSS_VER=${MPSS_VER:0:1}.${MPSS_VER:1:1}.${MPSS_VER:2:1}

src_unpack() {
        unpack ${A}
	unpack ./mpss-${MPSS_VER}/src/linux-${PV%_p*}+mpss${MPSS_VER}.tar.bz2
	mv linux-${PV%_p*}+mpss${MPSS_VER} linux-${PV}-mic
}
