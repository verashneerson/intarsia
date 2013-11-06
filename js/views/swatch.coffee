class Intarsia.Views.Swatch extends Backbone.View
  model: Intarsia.Models.Swatch

  tagName: 'li'
  className: 'palette-color'
  template: Hogan.compile $('#swatch-template').html()

  defaults: ->
    color: 'default'

  events:
    'click a': 'setColor'

  initialize: ->
    @options = _.extend({}, @defaults(), @options)
    @listenTo events, 'swatch:select', @markSelected

  setColor: (evt) =>
    evt.preventDefault()
    events.trigger 'swatch:select', @model.get 'color'
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
    return this
