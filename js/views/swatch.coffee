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

  setColor: (evt) =>
    evt.preventDefault()
    events.trigger('palette:change', @model.get 'color')
    return false

  render: ->
    color = @model.get 'color'
    @$el.addClass(color).html(@template.render color: color)
    return this
