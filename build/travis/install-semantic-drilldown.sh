#! /bin/bash
set -ex

BASE_PATH=$(pwd)
MW_INSTALL_PATH=$BASE_PATH/../mw

cd $MW_INSTALL_PATH/extensions
#git clone https://gerrit.wikimedia.org/r/mediawiki/extensions/SemanticDrilldown.git
git clone https://github.com/gesinn-it/SemanticDrilldown.git

cd ..
echo 'require_once "$IP/extensions/SemanticDrilldown/SemanticDrilldown.php";' >> LocalSettings.php
php maintenance/update.php --skip-external-dependencies --quick

if [ "$PHPUNIT" != "" ]
then
	composer require 'phpunit/phpunit='$PHPUNIT --update-with-dependencies
fi
