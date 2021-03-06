# Require.js allows us to configure shortcut alias
# Their usage will become more apparent further along in the tutorial.
require.config
  paths:
    jquery: [
      '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min',
      '../vendor/jquery/jquery.min'
    ]
    underscore: [
      #'//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min',
      #'../vendor/underscore/underscore-min'
      '//cdnjs.cloudflare.com/ajax/libs/lodash.js/2.4.1/lodash.min',
      '../vendor/lodash/dist/lodash.min'
    ]
    backbone: [
      '//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.0/backbone-min',
      '../vendor/backbone/backbone-min'
    ]
    handlebars: [
      '//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.1.2/handlebars.min',
      '../vendor/handlebars/handlebars.amd.min'
    ]
    bootstrap: [
      '//netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min',
      '../vendor/bootstrap/dist/js/bootstrap.min'
    ]
    modernizr: '../vendor/modernizr/modernizr-custom'
    templates: '../templates'
    text: '../vendor/requirejs-text/text'
    'backbone.localStorage': '../vendor/backbone.localStorage/backbone.localStorage'

  shim:
    underscore:
      deps: []
      exports: '_'
    backbone:
      deps: ['underscore', 'jquery']
      exports: 'Backbone'
    handlebars:
      exports: "Handlebars"
    modernizr:
      exports: "Modernizr"
    bootstrap:
      deps: ['jquery']
    'backbone.localStorage':
      deps: ['backbone'],
      exports: 'Backbone'

require [
  'backbone'
  'router'
  'bootstrap'
  'modernizr'
], (Backbone, AppRouter) ->
  $ ->
    router = new AppRouter()
    Backbone.history.start()
