#!/bin/bash
set -eo pipefail

cd "$(dirname "$(readlink -f "$BASH_SOURCE")")"

versions=( "$@" )
if [ ${#versions[@]} -eq 0 ]; then
	versions=( */ )
fi
versions=( "${versions[@]%/}" )

# sort version numbers with highest first
IFS=$'\n'; versions=( $(echo "${versions[*]}" | sort -rV) ); unset IFS

for version in "${versions[@]}"; do
	echo "$version"
	cat > "$version/Dockerfile" <<EOD
#
# THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM guusk/docker-texlive:$version
MAINTAINER Guus Kuiper <guuskuiper@gmail.com>

RUN apt-get update -q && apt-get install -qy --no-install-recommends \\
            wget gawk bc \\
            gnuplot \\
            build-essential \\
            git \\
			poppler-utils \\
            imagemagick \\
            unzip \\
            xzdec \\
            ghostscript \\
            sudo \\
    &&  rm -rf /var/lib/apt/lists/*

RUN echo "Europe/Amsterdam" > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata
EOD
done
