# stylus-flat-ui-colors
[Flat UI Colors](http://flatuicolors.com) functions, mixins, and variables for stylus and sass

## Getting started
This library comes in three variants, including css, stylus, and sass.

To get the bare minimum up and running, download `/dist/css/flat-ui-colors.min.css` and reference this file in your project like any other stylesheet.

## Usage
You now have access to several classes including the below:

```css
.color-turquoise { background-color: #1abc9c; }
.color-text-turquoise { color: #1abc9c; }
```

For a full list of colors you may choose from, see http://flatuicolors.com

## Compile
To compile yourself, download the respective folder within `/src` and run the below command(s).

#### Stylus
```
$ stylus -w main.styl
```

Optionally add prefixes to all classes

```
$ stylus --prefix fui- main.styl
```

The newly generated css classes will now prepended with **fui**:

```css
.fui-color-turquoise { background-color: #1abc9c; }
.fui-color-text-turquoise { color: #1abc9c; }
```

#### Sass

```shell
$ sass -o css -w styl
```
More coming soon...
