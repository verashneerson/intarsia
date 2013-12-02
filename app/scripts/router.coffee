define [
  'backbone'
  'views/pattern'
  ], (Backbone, PatternView) ->

  class AppRouter extends Backbone.Router
    routes:
      '': 'index'    # default

    index: ->
      pattern = new PatternView
        el: '#intarsia'
        width: 30
        height: 30
