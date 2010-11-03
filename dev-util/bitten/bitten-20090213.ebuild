# Copyright 1999-2008 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/www-apps/trac/trac-0.11.2.ebuild,v 1.3 2008/11/16 17:47:23 maekke Exp $

inherit distutils subversion

ESVN_REPO_URI="http://svn.edgewall.org/repos/bitten/branches/experimental/trac-0.11"
ESVN_PROJECT="bitten"

DESCRIPTION="Bitten is continuous integration plugin for Trac."
HOMEPAGE="http://trac.edgewall.com/"
LICENSE="trac"

IUSE=""

KEYWORDS="amd64 ppc ppc64 sparc x86"

# doing so because tools, python packages... overlap
SLOT="0"

DEPEND="
	${DEPEND}
	dev-python/setuptools
	"

RDEPEND="
	${RDEPEND}
	trac? (
		www-apps/trac
	)
	"

src_unpack(){
	subversion_src_unpack
}


src_install() {
	distutils_src_install
}
