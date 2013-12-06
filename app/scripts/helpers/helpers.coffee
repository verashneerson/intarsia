define (require) ->
  Color       = require 'helpers/color'
  ColorString = require 'helpers/color_string'
  do ->
    # only supports 6-digit hex and rgb(a) values; no color names
    darken: (colorVal, percent = percent || 10) ->
      colorStr = new ColorString colorVal
      colorObj = colorStr.toColor()

      # don't adjust color if conversion fails
      return colorVal unless colorObj #is colorVal

      color = new Color colorObj
      return color.adjust(percent).toHex()

    lighten: (color, percent) ->
      @darken color, -percent
