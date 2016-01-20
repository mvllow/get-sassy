# stylus-flat-ui-colors
[Flat UI Colors](http://flatuicolors.com) functions, mixins, and variables for stylus and sass

## Usage
Coming soon to a store near you

## Compile
To compile yourself, download the respective folder within `/src` and run the below command(s).

### Stylus
```
$ stylus -o css -w styl
```

Optionally add prefixes to all classes

```
$ stylus --prefix fui- -o css -w styl
```

The newly generated css classes will now prepended with **fui**:

```css
.fui-color-turquoise { background-color: #1abc9c; }
.fui-color-text-turquoise { color: #1abc9c; }
```

### Sass

```shell
$ sass -o css -w styl
```
More coming soon...
