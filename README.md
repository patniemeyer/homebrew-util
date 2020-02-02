
# Orchid Homebrew Repository

This is the Orchid homebrew utilities "tap".
This repo contains the homebrew formulas and archives.

## Orchid VPN

Orchid: VPN, Personal Firewall 
[https://www.orchid.com/]

Installation:

`brew install orchidtechnologies/utils/orchid-cli`

# Homebrew package

This folder contains a command line script `orchid-cli` for running the Orchid vpn via homebrew.
The script and binary files are zipped, named by version, and placed into the archives folder to be referenced by the 
`orchid-cli.rb` homebrew formula hosted on our repository `orchid/homebrew-util`.

## Creating a new version

1) Update the version number and binary dist file location in create-archive.sh and run the script, noting the sha hash of the new archive.  By convention the dist files are named with the build sha but the archive script will rename them appropriately.

2) Update the `orchid-cli.rb` file in the `orchid/homebrew-util` repository with the new archive name and sha.

