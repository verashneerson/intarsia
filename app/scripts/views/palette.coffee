define [
  'jquery'
  'backbone'
  'vent'
  'collections/swatches'
  'views/swatches'
  'models/palette'
  ], ($, Backbone, AppEvents, SwatchesCollection, SwatchesView, PaletteModel) ->
  class PaletteView extends Backbone.View
    model: new PaletteModel
    tagName: 'div'
    className: 'intarsia-palette-holder'

    initialize: (options) ->
      console.log @model
      colors = (color: color for color in @model.options.colors)
      @palette = new SwatchesView
        collection: new SwatchesCollection colors
      @listenTo AppEvents, 'pattern:reset', @reset

    setDefaultColor: ->
      @palette.setDefaultColor()

    render: ->
      @$el.prepend(@palette.render().el)  # append swatches
      this
