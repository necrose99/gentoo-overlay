# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/dev-php5/pecl-zip/pecl-zip-1.8.10.ebuild,v 1.9 2008/01/10 10:02:29 vapier Exp $

PHP_EXT_NAME="libevent"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"

inherit php-ext-pecl-r1

KEYWORDS="alpha amd64 arm hppa ia64 ppc ppc64 s390 sh sparc x86 ~x86-fbsd"

DESCRIPTION="PHP libevent extension."
LICENSE="PHP"
SLOT="0"

DEPEND="dev-libs/libevent"
RDEPEND="${DEPEND}"

need_php_by_category
