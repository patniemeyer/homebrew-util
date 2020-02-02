#!/bin/sh

version="1.0.0"
dist='dist/orchid-1.0.0-f5ce7d3'

archive="archives/orchid-cli-${version}.zip"

# Create the archive.
rm -f "$archive"

cp $dist /tmp/orchid
# -j ignores paths and places the files at the top level
zip -j $archive /tmp/orchid scripts/orchid-cli.sh
rm /tmp/orchid

# Report the sum
echo "\n"
echo "Update the published brew formula with the following SHA and archive name:"
shasum -a 256 $archive

