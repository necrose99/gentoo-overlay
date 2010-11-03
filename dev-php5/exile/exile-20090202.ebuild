inherit subversion

DEPEND="dev-lang/php dev-php5/operator"
RDEPEND="${DEPEND}"
KEYWORDS="amd64 ppc ppc64 sparc x86 x86-fbsd"
SLOT="0"
IUSE=""
ESVN_REPO_URI="https://svn.aelatis.com/exile/trunk"
ESVN_PROJECT="exile"
HOMEPAGE="http://exile.aelatis.com"
LICENSE="xsl"
DESCRIPTION="The PHP framework by Izaak Schroeder"

src_install() {
	mkdir -p "${D}/var/exile"
	cp -R * "${D}/var/exile"
}

