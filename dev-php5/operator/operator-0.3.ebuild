inherit eutils versionator

SRC_URI="http://pecl.php.net/get/operator-0.3.tgz"
DEPEND="dev-lang/php"
RDEPEND="${DEPEND}"
KEYWORDS="amd64 ~ppc ~ppc64 ~sparc x86 ~x86-fbsd"
SLOT="0"
IUSE=""

PHP_EXT_INI="yes"
PHP_EXT_NAME="operator"
PHP_EXT_ZENDEXT="no"

inherit php-ext-source-r1

need_php_by_category

src_unpack() {
	php-ext-source-r1_src_unpack
	cd "${S}"
	epatch "${FILESDIR}/01_segf.diff"
	
	# For double access segfaults
	epatch "${FILESDIR}/02_izaak.diff"
	
	# For PHP 5.3
	epatch "${FILESDIR}/03_cernava.diff"
}

src_compile() {
	php-ext-source-r1_src_compile
}

src_install() {
	php-ext-source-r1_src_install
}
