#!/bin/bash

echo "Building assets"
(cd dashboard; npm run build)
echo "Removing old assets"
rm -rf backend/static
echo "Copying assets"
cp -r dashboard/dist backend/static
mv backend/static/static/css backend/static
mv backend/static/static/js backend/static
echo "All done"
