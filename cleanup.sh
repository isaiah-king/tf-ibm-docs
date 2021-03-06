#!/bin/bash

# Publishes the output from ./build.sh to GitHub pages
# @Author: Chris Kelner
# Copyright (c) 2017 IBM under MIT License

set -e
PARENT_DIR=$(pwd)

# Gets configuration for scripts; versions, repo, search strings, etc
source config.sh

for release in "${RELEASES[@]}"; do
  if [ -d "./source/$release" ]; then
    rm -rf ./source/$release
  fi
done

if [ -d "./terraform" ]; then
  rm -rf ./terraform
fi

if [ -d "./build" ]; then
  rm -rf ./build
fi

if [ -d "./docs" ]; then
  rm -rf ./docs
fi

if [ -d "./source/r" ]; then
  rm -r ./source/r
fi

if [ -d "./source/d" ]; then
  rm -r ./source/d
fi

if [ -f "./source/index.html.markdown" ]; then
  rm ./source/index.html.markdown
fi

sed '/<!-- REPLACEME -->/q' source/_inject-schematics.md > tmp
mv tmp source/_inject-schematics.md

exit 0
