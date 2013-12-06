define (require) ->
  class ColorString
    constructor: (@color) ->

    toColor: ->
      if @isHex()
        return @hexToColor()
      else if @isRgb()
        return @rgbToColor()
      else
        return false

    # 6-digit hex
    isHex: ->
      return /^#?([a-f\d]){6}$/i.test(@color)

    # rgb or rgba color
    isRgb: ->
      return /rgb(a){0,1}\((\d{1,3})(,( ){0,1}(\d{1,3})){2,3}\)/.test(@color)

    # hex string to {r, g, b}
    hexToColor: ->
      hex = parseInt(@color.replace(/^#/,''), 16)
      return r: (hex >> 16) & 255, g: (hex >> 8) & 255, b: hex & 255

    # rgb string to {r, g, b}
    rgbToColor: ->
      colorValues = @color.match /\d+/g
      return r: colorValues[0], g: colorValues[1], b: colorValues[2]
