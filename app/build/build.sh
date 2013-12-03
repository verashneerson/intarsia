r.js -o build/app.build.js
cd ../dist
rm -rf build build.txt      # remove build files
rm -rf scripts/vendor/modernizr scripts/vendor/require-plugins      # remove non-CDN-backup vendor files
rm -rf scripts/views scripts/models scripts/collections scripts/vent.js scripts/router.js     # remove app's js source files
rm -rf sass data templates  # remove app's non-js source files
