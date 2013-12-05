define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'handlebars'
  'text!templates/swatch.html'
  ], ($, _, Backbone, AppEvents, Handlebars, template) ->

  class SwatchView extends Backbone.View
    tagName: 'li'
    className: 'intarsia-palette-color'
    template: Handlebars.compile template

    defaults: ->
      color: 'default'

    events:
      'click button': 'setColor'

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
      #console.log "markSelected #{color}"
      if color is @model.get 'color'
        @$el.addClass('selected')
      else
        @$el.removeClass('selected')

    render: ->
      color = @model.get 'color'
      @$el.html @template @model.toJSON()
      this
