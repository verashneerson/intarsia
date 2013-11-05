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
    @options = _.extend({}, @defaults(), @options)
    models = []
    for color in @options.colors
      models.push new Intarsia.Models.Swatch({ color: color })
    @collection = new Intarsia.Collections.Swatches(models)
    @childViews = []
    #@render()

    @collection.on 'reset', @resetCollection, this
    events.on 'palette:change', @selectColor, this
    events.on 'pattern:reset', @resetCollection, this

  # selects the first swatch in palette
  setDefaultColor: -> $(@childViews[0].el).find('a').click()

  # marks this swatch as selected
  selectColor: (color) =>
    @$el.find('.selected').removeClass('selected')
    @$el.children(".#{color}").addClass('selected')

  addSwatch: (model) ->
    swatch = new Intarsia.Views.Swatch model: model
    @childViews.push swatch
    @$el.append(swatch.render().el)

  resetCollection: ->
    _(@childViews).each (cv) -> cv.off(); cv.remove()
    @childViews = []
    _(@collection.models).each (model) => @addSwatch model
    @setDefaultColor()

  render: ->
    @resetCollection()
    return this
