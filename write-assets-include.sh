#!/bin/bash

ENTRY_BASENAME=main
ENTRY_FILEPATH=src/${ENTRY_BASENAME}.js

DEV_SERVER_URL=http://localhost:5173
MANIFEST_FILEPATH=modulevitetest/views/dist/manifest.json

if [[ $NODE_ENV == 'development' ]]; then
	cat <<EOT >./modulevitetest/assets.include.php
<?php
define('MODULEVITETEST_DEV_SERVER_URL', '${DEV_SERVER_URL}');
define('MODULEVITETEST_ENTRY_FILEPATH', '${ENTRY_FILEPATH}');
EOT

elif [[ $NODE_ENV == 'production' ]]; then
	MANIFEST_CSS_FILEPATH=$(jq -r .\"src/${ENTRY_BASENAME}.css\".file $MANIFEST_FILEPATH)
	MANIFEST_JS_FILEPATH=$(jq -r .\"src/${ENTRY_BASENAME}.js\".file $MANIFEST_FILEPATH)
	MANIFEST_JS_LEGACY_FILEPATH=$(jq -r .\"src/${ENTRY_BASENAME}-legacy.js\".file $MANIFEST_FILEPATH)
	MANIFEST_POLYFILLS_LEGACY_FILEPATH=$(jq -r .\"vite/legacy-polyfills-legacy\".file $MANIFEST_FILEPATH)

	cat <<EOT >./modulevitetest/assets.include.php
<?php
define('MODULEVITETEST_CSS_FILEPATH', '${MANIFEST_CSS_FILEPATH}');
define('MODULEVITETEST_JS_FILEPATH', '${MANIFEST_JS_FILEPATH}');
define('MODULEVITETEST_JS_LEGACY_FILEPATH', '${MANIFEST_JS_LEGACY_FILEPATH}');
define('MODULEVITETEST_POLYFILLS_LEGACY_FILEPATH', '${MANIFEST_POLYFILLS_LEGACY_FILEPATH}');
EOT

else
	echo "Error: NODE_ENV must be set to 'development' or 'production'"
	exit 1
fi
