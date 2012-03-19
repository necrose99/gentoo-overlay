# Copyright 1999-2011 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=3

EGIT_REPO_URI="https://github.com/elasticsearch/elasticsearch.git"

inherit eutils java-pkg-2 git-2

DESCRIPTION="So, we build a web site or an application and want to add search to
it, and then it hits us: getting search working is hard. We want our search
solution to be fast, we want a painless setup and a completely free search
schema, we want to be able to index data simply using JSON over HTTP, we want
our search server to be always available, we want to be able to start with one
machine and scale to hundreds, we want real-time search, we want simple
multi-tenancy, and we want a solution that is built for the cloud."
HOMEPAGE="http://www.elasticsearch.org"

LICENSE="Apache-2"
SLOT="0"
KEYWORDS="x86 amd64"
IUSE="python"

DEPEND="
	>=virtual/jdk-1.6 
	dev-util/sigar 
	python? ( dev-java/jython )
"
RDEPEND="${DEPEND}"

pkg_setup() {
	enewgroup elasticsearch
	enewuser elasticsearch -1 -1 -1 elasticsearch
}

src_compile() {
	#export GRADLE_USER_HOME="${T}/home" 
	export GRADLE_OPTS=-Dgradle.user.home="${T}/home"
	addwrite /root/.gradle/
	use python && java-pkg_jar-from jython
	./gradlew
}

src_install() {
	tar -xzf build/distributions/elasticsearch-0.18.0-SNAPSHOT.tar.gz
	cd elasticsearch-0.18.0-SNAPSHOT/

	dobin bin/elasticsearch
	insinto /usr/share/${PN}
	doins bin/elasticsearch.in.sh bin/plugin

	java-pkg_dojar lib/*.jar
	java-pkg_dojar lib/sigar/*.jar

	insinto /etc/elasticsearch
	rename .yml .original.yml config/*.yml
	doins config/*.yml || die "doins failed"

	doinitd "${FILESDIR}/elasticsearch.initd"
}

