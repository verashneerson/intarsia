class Intarsia.Models.Stitch extends Backbone.Model
  defaults: ->
    color: 'default'
    row: 0

  initialize: ->
    @options = _.extend({}, @defaults(), @options)

  # Paints stitch if it isn't already this color; otherwise erases it
  paint: (color) ->
    if @get('color') is color
      @erase()
    else
      @set color: color

  # "Erases" the stitch by setting its color to default
  erase: -> @set color: @defaults().color

class Intarsia.Collections.Stitches extends Backbone.Collection
  model: Intarsia.Models.Stitch
  url: '/json/grid.json'
