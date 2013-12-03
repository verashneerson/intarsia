// Node build file
({
  appDir: "../",
  baseUrl: "scripts",
  include: "main",
  name: 'main',
  //exclude: ["jquery", "underscore", "backbone", "handlebars"],
  dir: "../../dist",
  optimizeCss: 'standard',
  mainConfigFile: '../scripts/main.js',
  fileExclusionRegExp: /\.coffee$/,

  paths: {
    jquery: 'empty:',
    underscore: 'empty:',
    backbone: 'empty:',
    handlebars: 'empty:'
  }
})
