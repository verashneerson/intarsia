define [
  'jquery'
  'backbone'
  'vent'
  'handlebars'
  'text!templates/palette.html'
  'collections/swatches'
  'views/palette/swatches'
  'models/palette'
  ], ($, Backbone, AppEvents, Handlebars, template, SwatchesCollection, SwatchesView, PaletteModel) ->
  class PaletteView extends Backbone.View
    model: new PaletteModel()
    tagName: 'div'
    className: 'intarsia-palette-holder'
    template: Handlebars.compile template

    initialize: (options) ->
      swatches = (color: color for color in @model.options.swatches)
      @model.swatches = new SwatchesCollection swatches
      @palette = new SwatchesView
        collection: @model.swatches
      @listenTo AppEvents, 'pattern:reset', @reset

    setDefaultColor: ->
      @palette.setDefaultColor()

    render: ->
      @$el.html @template({ title: "Choose your stitch color:" })
      @$el.find('.panel-body').append(@palette.render().el)
      @
