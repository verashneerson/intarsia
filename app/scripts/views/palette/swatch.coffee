define [
  'jquery'
  'underscore'
  'backbone'
  'app'
  'handlebars'
  'text!templates/swatch.html'
  ], ($, _, Backbone, App, Handlebars, template) ->

  class SwatchView extends Backbone.View
    tagName: 'li'
    className: 'intarsia-palette-color'
    template: Handlebars.compile template

    defaults: ->
      color: 'default'

    events:
      'click a': 'setColor'

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)
      @listenTo App.vent, 'swatch:select', @markSelected
      @listenTo App.vent, 'swatch:remove', @remove

    setColor: (evt) =>
      evt.preventDefault()
      App.vent.trigger 'swatch:select', @model.get 'color'
      return false

    # marks swatch as selected
    markSelected: (color) =>
      #console.log "markSelected #{color}"
      if color is @model.get 'color'
        @$el.addClass('selected')
      else
        @$el.removeClass('selected')

    render: ->
      color = @model.get 'color'
      @$el.html @template @model.toJSON()
      this
