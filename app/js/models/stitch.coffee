define ['backbone', 'underscore'], (Backbone, _) ->
  class StitchModel extends Backbone.Model
    defaults: ->
      color: 'default'

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)

    # Paints stitch if it isn't already this color; otherwise erases it
    paint: (color) ->
      if @get('color') is color
        @erase()
      else
        @set color: color

    # "Erases" the stitch by setting its color to default
    erase: -> @set color: @defaults().color
