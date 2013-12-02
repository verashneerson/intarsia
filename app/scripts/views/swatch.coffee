define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'hogan'
  ], ($, _, Backbone, AppEvents, Hogan) ->

  class SwatchView extends Backbone.View
    tagName: 'li'
    className: 'palette-color'
    template: Hogan.compile $('#swatch-template').html()

    defaults: ->
      color: 'default'

    events:
      'click a': 'setColor'

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)
      @listenTo AppEvents, 'swatch:select', @markSelected
      @listenTo AppEvents, 'swatch:remove', @remove

    setColor: (evt) =>
      evt.preventDefault()
      AppEvents.trigger 'swatch:select', @model.get 'color'
      return false

    # marks swatch as selected
    markSelected: (color) =>
      console.log "markSelected #{color}"
      if color is @model.get 'color'
        @$el.addClass('selected')
      else
        @$el.removeClass('selected')

    render: ->
      color = @model.get 'color'
      @$el.addClass(color).html(@template.render color: color)
      this
