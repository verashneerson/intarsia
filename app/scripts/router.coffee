define [
  'jquery'
  'backbone'
  'models/pattern'
  'views/pattern/pattern'
  'views/pattern/forms/create'
  ], ($, Backbone, PatternModel, PatternView, PatternCreateView) ->

  class AppRouter extends Backbone.Router
    el: $('#intarsia')

    routes:
      'patterns/new': 'newPattern'
      '*action': 'index'    # default

    index: =>
      # pattern grid
      pattern = new PatternModel({"name":"My awesome pattern","width":40,"height":30,"grid":[[{"color":"red"},{"color":"green"},{"color":"default"},{"color":"blue"},{"color":"default"},{"color":"default"},{"color":"yellow"},{"color":"default"},{"color":"default"},{"color":"default"}],[{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"}],[{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"},{"color":"default"}]]})
      patternView = new PatternView model: pattern
      @el.append patternView.render().el

    newPattern: ->
      appView = new PatternCreateView()
      @el.append appView.render().el
