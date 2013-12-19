define (require) ->
  _     = require 'underscore'
  App   = require 'app'

  class Color
    # Color string types
    hex:      /^#?([a-f\d]){6}$/i                      # #FFFFFF
    shortHex: /^#?([a-f\d]){3}$/i                      # #FFF
    rgb:      /rgba?\((\d{1,3})(, ?(\d{1,3})){2,3}\)/  # rgb(0,0,0) or rgba(0,0,0,0)

    # Constructs an object containing r,g,b values from a color string
    constructor: (color) ->
      type = @getType color
      @color = switch type
        when 'hex'      then @hexToColor color
        when 'shortHex' then @hexToColor @shortHexToHex(color)
        when 'rgb'      then @rgbToColor color
        else                 @hexToColor App.baseColor    # default color (hex)

    # Returns type of color string
    getType: (color) ->
      return switch
        when @hex.test(color)      then 'hex'
        when @shortHex.test(color) then 'shortHex'
        when @rgb.test(color)      then 'rgb'
        else                            'invalid'

    # Converts short-form hex (#FFF) to full hex (#FFFFFF)
    shortHexToHex: (color) ->
      channels = color.match /[a-f\d]/gi                  # split into r,g,b channels
      longHex = _.map(channels, (val) -> "#{val}#{val}")   # duplicate channel vals
      return "##{longHex.join ""}"

    # Converts hex string to {r,g,b} object
    hexToColor: (color) ->
      hex = parseInt(color.replace(/^#/,''), 16)
      return r: (hex >> 16) & 255, g: (hex >> 8) & 255, b: hex & 255

    # Converts rgb string to {r,g,b} object
    rgbToColor: (color) ->
      colorValues = color.match /\d+/g
      return r: colorValues[0], g: colorValues[1], b: colorValues[2]

    # Adjusts individual channel value by given percentage
    adjustChannel: (channel, percent = percent || 10) ->
      newChannel = parseInt(channel * (100 - percent) / 100)
      return switch
        when newChannel > 255 then 255
        when newChannel < 0   then 0
        else newChannel

    # Adjusts color value by given percentage
    adjust: (percent) ->
      @color[c] = @adjustChannel(@color[c], percent) for c in ['r','g','b']
      @

    # Converts {r,g,b} object to rgb color string, e.g., rgb(255,255,255)
    toRgb: ->
      return "rgb(#{@color.r}, #{@color.g}, #{@color.b})"

    # Converts {r,g,b} object to hex string, e.g., #FFFFFF
    toHex: ->
      hex = (1 << 24) + (@color.r << 16) + (@color.g << 8) + @color.b
      return "#" + hex.toString(16).slice(1)
