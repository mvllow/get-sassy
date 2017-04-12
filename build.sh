#!/bin/bash

clear

version="0.2"
package="sassy-fui"

color_reset="\033[0m"
solor_failed="\033[91m"
solor_success="\033[0;32m"

echo "Sassy-fui build tool"
echo

if ! -d dist &>/dev/null; then
    echo "Creating output directory..."
    mkdir -p dist
fi

if command -v sass &>/dev/null; then
    echo "Building sass version..."

    lang="sass"
    lang_ext="scss"

    echo "Compiling $lang to css..."
    sass src/main.$lang_ext dist/$package.css --sourcemap=none
    sass src/main.$lang_ext dist/$package.min.css --sourcemap=none --style compressed

    echo "Compiling lib..."
    echo "/*!
     * version: $version
     * mellowdev.com | @sociallymellow
     * github.com/sociallymellow/$package
     */" > dist/$package.$lang_ext

    echo "${solor_success}Success${color_reset}"
else
    echo "${solor_failed}Err${color_reset} sass not found"
fi

if command -v stylus &>/dev/null; then
    echo "Building stylus version..."

    lang="stylus"
    lang_ext="styl"

    echo "Compiling $lang to css..."
    stylus -o dist/$package.css src/main.$lang_ext > /dev/null 2>&1
    stylus -c -o dist/$package.min.css src/main.$lang_ext > /dev/null 2>&1
    stylus -P fui- -o dist/$package.pre.css src/main.$lang_ext > /dev/null 2>&1
    stylus -P fui- -c -o dist/$package.pre.min.css src/main.$lang_ext > /dev/null 2>&1

    echo "Compiling lib..."
    echo "/*!
     * version: $version
     * mellowdev.com | @sociallymellow
     * github.com/sociallymellow/$package
     */" > dist/$package.$lang_ext

    echo "${solor_success}Success${color_reset}"
    echo
else
    echo "${solor_failed}Err${color_reset} stylus not found"
fi
