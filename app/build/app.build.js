// Node build file
({
  appDir: "../",
  baseUrl: "scripts",
  include: "main",
  name: 'main',
  exclude: ["jquery", "underscore", "backbone", "handlebars", "backbone.localStorage"],
  dir: "../../dist",
  optimizeCss: 'standard',
  mainConfigFile: '../scripts/main.js',
  fileExclusionRegExp: /\.coffee$/,

  paths: {
    jquery: 'vendor/jquery/jquery.min',
    underscore: 'vendor/underscore/underscore-min',
    backbone: 'vendor/backbone/backbone-min',
    handlebars: 'vendor/handlebars/handlebars.amd.min',
    modernizr: 'vendor/modernizr/modernizr',
    'backbone.localStorage': 'vendor/backbone.localStorage/backbone.localStorage',
    text: 'vendor/requirejs-text/text',
    templates: '../templates'
  }
})
