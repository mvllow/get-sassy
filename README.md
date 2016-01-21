# stylus-flat-ui-colors
[Flat UI Colors](http://flatuicolors.com) functions, mixins, and variables for stylus and sass

## Getting started
This library comes in three variants, including css, stylus, and sass.

To get the bare minimum up and running, download `/dist/css/flat-ui-colors.min.css` and reference this file in your project like any other stylesheet.

Optionally you can download `/dist/css/flat-ui-colors.pre.min.css` instead for prefixed classes (more info below).

## Usage
You now have access to several classes including the below:
```css
.color-turquoise { background-color: #1abc9c; }
.color-text-turquoise { color: #1abc9c; }
```

If you downloaded the prefixed version:
```css
// prefixed class names
.fui-color-turquoise { background-color: #1abc9c; }
.fui-color-text-turquoise { color: #1abc9c; }
```

For a full list of colors you may choose from, see http://flatuicolors.com

## Compile
To compile yourself, it is best to clone the repo to your machine so the file structure is maintained. This way you may use the automatic build script included in the package.

#### Stylus
To compile stylus, install [NodeJS](https://nodejs.org/en/download/) and open up terminal to install stylus:
```shell
$ sudo npm install -g stylus
```

#### Sass
To compile sass, install [Ruby](https://www.ruby-lang.org/en/downloads/) (some systems come with ruby preinstalled) and open up terminal to install sass:
```shell
$ sudo gem install sass
```

Please note that there are other options to install sass but the above is the most universal way.

Once either stylus or sass installed on your system, run the build script by opening terminal in the project's root directory:
```shell
$ ./build.sh
```
