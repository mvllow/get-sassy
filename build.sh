#!/bin/bash
clear

version="0.1"
package="flat-ui-colors"

color_end="\e[0m"
color_green="\e[0;32m"

# Check dist file structure
function checkFiles {
    if [ ! -d dist ]; then
        echo "creating directory: dist"
        mkdir -p dist
    fi

    if [ ! -d dist/css ]; then
        echo "creating directory: dist/css"
        mkdir -p dist/css
    fi

    if [ "$lang" = "stylus" ]; then
        if [ ! -d dist/stylus ]; then
            echo "creating directory: dist/stylus"
            mkdir -p dist/stylus
        fi
    fi

    if [ "$lang" = "sass" ]; then
        if [ ! -d dist/sass ]; then
            echo "creating directory: dist/sass"
            mkdir -p dist/sass
        fi
    fi
}

echo "Flat UI Colors compiler"
echo "-"
echo "Please select your language"
echo
echo "1. Stylus"
echo "2. Sass"
echo
echo -e "Option #: "
read r_lang

if [ "$r_lang" = "1" ]; then
    clear
    lang="stylus"
    lang_ext="styl"
    default_params=""

    echo -e "Prefix all classes with 'fui-'? (y/N)"
    read r_is_prefixed

    if [ "$r_is_prefixed" = "y" ]; then
        is_prefixed="--prefix fui-"
        is_prefixed_name="pre."
    fi

    echo
    echo -e "Compress output CSS? (y/N)"
    read r_is_compressed

    if [ "$r_is_compressed" = "y" ]; then
        is_compressed="-c"
        is_compressed_name="min."
    fi

    echo "setting up parameters..."
    params="$is_prefixed $is_compressed"
    name="$package.${is_prefixed_name}${is_compressed_name}css"

    echo "checking file structure..."
    checkFiles

    echo "compiling $lang to css..."
    stylus $params -o dist/css/$name src/$lang/main.$lang_ext > /dev/null 2>&1

    echo "compiling lib..."
    echo "/*!
     * version: $version
     * mellowdev.com | @sociallymellow
     * github.com/sociallymellow/stylus-flat-ui-colors
     */" > dist/$lang/$package.$lang_ext

    cat src/$lang/partials/_variables.$lang_ext >> dist/$lang/$package.$lang_ext
    cat src/$lang/partials/_functions.$lang_ext >> dist/$lang/$package.$lang_ext
    cat src/$lang/partials/_helpers.$lang_ext >> dist/$lang/$package.$lang_ext
    cat src/$lang/partials/_mixins.$lang_ext >> dist/$lang/$package.$lang_ext

    echo -e "${color_green}success${color_end}"
    echo

elif [ "$r_lang" = "2" ]; then
    clear
    lang="sass"
    lang_ext="scss"
    default_params=""

    echo
    echo -e "Compress output CSS? (y/N)"
    read r_is_compressed

    if [ "$r_is_compressed" = "y" ]; then
        is_compressed="--style compressed"
        is_compressed_name="min."
    fi

    echo "setting up parameters..."
    params="$is_compressed"
    name="$package.${is_compressed_name}css"

    echo "checking file structure..."
    checkFiles

    echo "compiling $lang to css..."
    sass src/$lang/main.$lang_ext dist/css/$name $params

    echo "compiling lib..."
    echo "/*!
     * version: $version
     * mellowdev.com | @sociallymellow
     * github.com/sociallymellow/stylus-flat-ui-colors
     */" > dist/$lang/$package.$lang_ext

    cat src/$lang/partials/_variables.$lang_ext >> dist/$lang/$package.$lang_ext
    cat src/$lang/partials/_functions.$lang_ext >> dist/$lang/$package.$lang_ext
    cat src/$lang/partials/_helpers.$lang_ext >> dist/$lang/$package.$lang_ext
    cat src/$lang/partials/_mixins.$lang_ext >> dist/$lang/$package.$lang_ext

    echo -e "${color_green}success${color_end}"
    echo
fi
