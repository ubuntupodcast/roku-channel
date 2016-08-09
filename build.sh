#!/usr/bin/env bash

app="ubuntupodcast"

# The manifest is not really shell, but this "works".
source ./manifest 2>/dev/null

# Zip the bundle.
zip -r ${app}-${major_version}.${minor_version}.${build_version}.zip . -x *.git* -x build.sh -x README.md -x LICENSE -x *.zip

# Increment the build version and update the manifest.
new_build_version=$(( ${build_version} + 1 ))
sed -i "s/build_version=${build_version}/build_version=${new_build_version}/" manifest