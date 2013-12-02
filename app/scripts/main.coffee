# Require.js allows us to configure shortcut alias
# Their usage will become more apparent further along in the tutorial.
require.config
  paths:
    jquery: [
      '//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min',
      'vendor/jquery/jquery-min'
    ]
    underscore: [
      '//cdnjs.cloudflare.com/ajax/libs/underscore.js/1.5.2/underscore-min',
      'vendor/underscore/underscore-min'
    ]
    backbone: [
      '//cdnjs.cloudflare.com/ajax/libs/backbone.js/1.1.0/backbone-min',
      'vendor/backbone/backbone-min'
    ]
    handlebars: [
      '//cdnjs.cloudflare.com/ajax/libs/handlebars.js/1.1.2/handlebars.min',
      'vendor/handlebars/handlebars-min'
    ]
    hogan: 'vendor/hogan'
    modernizr: 'vendor/modernizr/modernizr-min'
    templates: '../templates'
    text: 'vendor/require-plugins/text'
    'backbone.localStorage': [
      '//cdnjs.cloudflare.com/ajax/libs/backbone-localstorage.js/1.1.0/backbone.localStorage-min.js',
      'vendor/backbone.localStorage/backbone.localStorage'
    ]

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
    'backbone.localStorage':
      deps: ['backbone']
    hogan:
      exports: "Hogan"

require [
  'backbone'
  'router'
], (Backbone, AppRouter) ->
  router = new AppRouter
  Backbone.history.start()
