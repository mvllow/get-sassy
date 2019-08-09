# sassy-fui

[Flat UI Colors](http://flatuicolors.com) functions, mixins, and variables for Sass, Stylus, and vanilla CSS

## Getting started

To get the bare minimum up and running, download `/dist/sassy-fui.min.css` and reference this file in your project like any other stylesheet.

Optionally you can use `/dist/sassy-fui.pre.min.css` instead for prefixed classes.

## Usage

You now have access to helper classes:

```css
.color-turquoise { background-color: #1abc9c; }
.color-text-turquoise { color: #1abc9c; }
```

Prefixed:

```css
.fui-color-turquoise { background-color: #1abc9c; }
.fui-color-text-turquoise { color: #1abc9c; }
```

For a full list of colours you may choose from, see http://flatuicolors.com

## Build

To compile sassy-fui, you must have either Sass or Stylus installed globally and the src folder in the same location as the build script. Only one language is required to output vanilla CSS (Stylus is recommended if wanting to compile only CSS as it contains more variants such as prefixed class names).

```shell
$ sudo gem install sass
$ sudo npm i -g stylus
$ sh ./build.sh
```
