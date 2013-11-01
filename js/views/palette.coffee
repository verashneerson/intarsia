class Intarsia.Views.Palette extends Backbone.View
  collection: Intarsia.Collections.Swatches

  defaults:
    colors: [
      'red','orange','yellow','green','blue','navy','purple'
      'white','silver','grey','black'
      'default' # eraser color
    ]

  events:
    'click a': 'setColor'

  initialize: ->
    @render()

  # selects the first swatch in palette
  setDefaultColor: =>
    @$el.find('.palette-color a')[0].click()

  setColor: (evt) =>
    evt.preventDefault()

    # gets color from class
    newColor = $(evt.target).attr('class')
    events.trigger('palette:change', newColor)

    # marks this swatch as selected
    @$el.find('.selected').removeClass('selected')
    $(evt.target).parent().addClass('selected')

    return false

  render: ->
    #console.log 'PaletteView'
    colors = []
    for color in @defaults.colors
      color = "<li class='palette-color #{color}' data-color='#{color}'><a class='#{color}' href='#'></a></li>"
      colors.push color
    @$el.html(colors.join(''))
