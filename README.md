# DebianRipper
Manually rip and combine binary packages and dependencies from Debian packages archive

This is very preliminary, but seems to work well enough - use at your own risk.
It shoud have applications for embedded systems, where a package manager is undesirable, yet prebuilt binaries are useful.

download.sh takes as input an initially dowloaded .deb file, and downloads all its dependencies into the same directory.

generate.sh extracts all the .deb files in the current directory, and combines them into the archive data.tar.

Currently, architecture (armhf) and mirror(ftp.us.debian.org) are hard coded, but can be manually edited.

When extracting data.tar, do so in the root directory and use the --keep-old-files flag to avoid overwriting existing files.
