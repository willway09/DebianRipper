#!/bin/sh

function recursiveDownload() {
	deps=$(dpkg -I $1 | grep Depends | sed "s/ Depends: //g"  | tr "," "\n" | sed "s/|.*//g" | sed "s/(.*//g")

	for i in $deps; do
		echo "Downloading $i";
		url=$(curl -s https://packages.debian.org/bullseye/armhf/$i/download | grep ftp.us.debian.org | tr '"' "\n" | grep -E "\.deb$");
		file=$(echo $url | sed "s/.*\///g")

		if [[ ! -f "$file" ]]; then
			curl $url -O;
			recursiveDownload $file
		fi

	done
}

recursiveDownload $1
