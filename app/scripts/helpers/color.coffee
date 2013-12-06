define (require) ->
  class Color
    constructor: (@color) ->

    adjustChannel: (channel, percent) ->
      newChannel = parseInt(channel * (100 - percent) / 100)
      newChannel = 255 if newChannel > 255
      newChannel = 0 if newChannel < 0
      return newChannel

    adjust: (percent) ->
      @color[c] = @adjustChannel(@color[c], percent) for c in ['r','g','b']
      @

    toRgb: ->
      return "rgb(#{@color.r}, #{@color.g}, #{@color.b})"

    toHex: ->
      hex = (1 << 24) + (@color.r << 16) + (@color.g << 8) + @color.b
      return "#" + hex.toString(16).slice(1)
