class Intarsia.Views.Palette extends Backbone.View
  model: new Intarsia.Models.Palette

  tagName: 'div'
  className: 'intarsia-palette-holder'

  initialize: (options) ->
    console.log @model
    colors = (color: color for color in @model.options.colors)
    @palette = new Intarsia.Views.Swatches
      collection: new Intarsia.Collections.Swatches colors
    @listenTo events, 'pattern:reset', @reset

  setDefaultColor: ->
    @palette.setDefaultColor()

  render: ->
    @$el.prepend(@palette.render().el)  # append swatches
    this
