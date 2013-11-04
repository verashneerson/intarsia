class Intarsia.Views.Swatches extends Backbone.View
  collection: Intarsia.Collections.Swatches

  tagName: 'ul'
  className: 'intarsia-palette clearfix'

  defaults: ->
    colors: [
      'red','orange','yellow','green','blue','navy','purple'
      'white','silver','grey','black'
      'default' # eraser color
    ]

  initialize: ->
    models = []
    for color in @defaults().colors
      models.push new Intarsia.Models.Swatch({ color: color })
    @collection = new Intarsia.Collections.Swatches(models)
    @render()

    events.on 'palette:change', @selectColor, this
    events.on 'pattern:reset', @setDefaultColor, this

  # selects the first swatch in palette
  setDefaultColor: (evt) => @$el.find('.palette-color a')[0].click()

  # marks this swatch as selected
  selectColor: (color) =>
    @$el.find('.selected').removeClass('selected')
    @$el.children(".#{color}").addClass('selected')

  render: ->
    for item in @collection.models
      swatch = new Intarsia.Views.Swatch model: item
      swatch.render()
      @$el.append(swatch.el)
