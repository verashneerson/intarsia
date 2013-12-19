define (require) ->
  _        = require 'underscore'
  Backbone = require 'backbone'

  # application defaults
  do ->
    options =
      baseColor: '#fcfcfc'
      vent: _.extend {}, Backbone.Events
