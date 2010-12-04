# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/pecl-zip/pecl-zip-1.8.10.ebuild,v 1.9 2008/01/10 10:02:29 vapier Exp $

EAPI=2
PHP_EXT_NAME="uuid"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_EXT_PECL_PKG="uuid"

inherit php-ext-pecl-r2 eutils

KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

DESCRIPTION="PHP UUID extension."
LICENSE="PHP"
SLOT="0"

DEPEND="sys-fs/e2fsprogs"
RDEPEND="${DEPEND}"

#src_unpack() {
#	php-ext-source-r2_src_unpack
#}

src_prepare() {
	epatch "${FILESDIR}/01_izaak_raw.patch"
	php-ext-source-r2_src_prepare
}


