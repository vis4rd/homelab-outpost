#!/bin/bash

# Usage:
# Run only in a directory where this script is located.
# ./download-geo-db.sh

# Download the GeoLite2 Country database
curl -L -o GeoLite2-Country.tar.gz https://github.com/GitSquared/node-geolite2-redist/raw/refs/heads/master/redist/GeoLite2-Country.tar.gz

# Extract the database
tar -xzf GeoLite2-Country.tar.gz

# Move the .mmdb file to the config directory
mv GeoLite2-Country_*/GeoLite2-Country.mmdb .

# Clean up the downloaded files
rm -rf GeoLite2-Country.tar.gz GeoLite2-Country_*
