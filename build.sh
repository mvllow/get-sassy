#!/bin/bash
clear

version=0.1

# Check dist file structure
function checkFiles {
    if [ ! -d dist ]; then
        mkdir -p dist
    fi

    if [ ! -d dist/css ]; then
        mkdir -p dist/css
    fi

    if [ "$lang" = "stylus" ]; then
        if [ ! -d dist/stylus ]; then
            mkdir -p dist/stylus
        fi
    fi

    if [ "$lang" = "sass" ]; then
        if [ ! -d dist/sass ]; then
            mkdir -p dist/sass
        fi
    fi
}

echo
echo "Please select your language"
echo "(All options compile to their language and vanilla CSS)"
echo
echo "1. Sass (Coming soon)"
echo "2. Stylus"
echo
echo "3. Compile and compress all"
echo
echo -e "Option #: "
read lang

if [ "$lang" = "1" ]; then
    clear

    lang="sass"

    sass src/$lang/main.scss dist/css/flat-ui-colors.${min}css
elif [ "$lang" = "2" ]; then
    clear

    lang="stylus"

    echo
    echo -e "Prefix all classes with 'fui-'? (y/N)"
    read option_isPrefixed

    if [ "$option_isPrefixed" = "y" ]; then
        isPrefixed="--prefix fui-"
    fi

    echo
    echo -e "Compress output CSS? (y/N)"
    read option_isCompressed

    if [ "$option_isCompressed" = "y" ]; then
        min="min."
        isCompressed="-c"
    fi

    options="$isPrefixed $isCompressed"

    echo "checking file structure..."
    checkFiles

    echo "compiling $lang to css..."
    stylus $options -o dist/css/flat-ui-colors.${min}css src/$lang/main.styl > /dev/null 2>&1

    echo "compiling lib..."
    echo "/*!
     * version: $version
     * mellowdev.com | @sociallymellow
     * github.com/sociallymellow/stylus-flat-ui-colors
     */" > dist/$lang/flat-ui-colors.styl

    cat src/$lang/partials/_variables.styl >> dist/$lang/flat-ui-colors.styl
    cat src/$lang/partials/_functions.styl >> dist/$lang/flat-ui-colors.styl
    cat src/$lang/partials/_helpers.styl >> dist/$lang/flat-ui-colors.styl
    cat src/$lang/partials/_mixins.styl >> dist/$lang/flat-ui-colors.styl

    echo -e "\e[0;32msuccess\e[0m"
fi
