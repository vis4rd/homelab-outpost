#!/bin/bash

# Usage:
# Run only in a directory where this script is located.
# ./download-asn-db.sh

# Download the GeoLite2 ASN database
curl -L -o GeoLite2-ASN.tar.gz https://github.com/GitSquared/node-geolite2-redist/raw/refs/heads/master/redist/GeoLite2-ASN.tar.gz

# Extract the database
tar -xzf GeoLite2-ASN.tar.gz

# Move the .mmdb file to the config directory
mv GeoLite2-ASN_*/GeoLite2-ASN.mmdb .

# Clean up the downloaded files
rm -rf GeoLite2-ASN.tar.gz GeoLite2-ASN_*
