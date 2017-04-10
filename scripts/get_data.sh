#!/bin/bash
# This script get the protobuf diff files and the base image
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
wget http://abra.me/place/diffs.zip -O $DIR/..
unzip diffs.zip
rm diffs.zip
