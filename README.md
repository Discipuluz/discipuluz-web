# DISCIPULUZ WEB

    Discipuluz website front end, as of 2016

## TECNOLOGIES
[Polymer 1.0](https://www.polymer-project.org/1.0/)

## DEVELOPMENT

### Installing
* Install  [NodeJS with NPM](https://nodejs.org/) from its site or your package manager 
* Install  [Bower](https://bower.io/) with `$ npm install -g bower`
* Install  [Polymer CLI](https://www.npmjs.com/package/polymer-cli) with `$ npm install -g polymer-cli`
* Install needed components with `$ bower install` on projects folder

### Running
```
$ polymer serve
```

### Structure
This Project's components were divided in:
* `discipuluz-app.html` - The main component, responsible for mounting layout
* `discipuluz-layout/` - The master layout components (header, footer, etc)
* `discipuluz-pages/` -  The pages
* `discipuluz-components/` - Widgets, reusable
* `discipuluz-utils/` - Helpers, do not interact necessarily with visuals 


### Practices
In this project the following practices were used:
* HTML/CSS
    * identation: *tabs*
    * quotes: `"double"`
    * id: `lower_snake_case`
    * classes: `lower-hyphen-case`
* JS
    * semicolon: *no semicolons*
    * identation: *tabs*
    * quotes: `'simple'`
    * variables: `lower_snake_case`
    * constants: `UPPER_SNAKE_CASE`
    * functions: `lowerCamelCase`
    * classes: `UpperCamelCase`
    * privates: `_prefixedWithUnderlines`
    * json: *implicit strings on keys*
* Design: *mostly done based on google paper materials*

## PRODUCTION

### Build

```
$ polymer build
```

This will create a `build/` folder with `bundled/` and `unbundled/` sub-folders
containing a bundled (Vulcanized) and unbundled builds, both run through HTML,
CSS, and JS optimizers.

You can serve the built versions by giving `polymer serve` a folder to serve
from:

```
$ polymer serve build/bundled
```