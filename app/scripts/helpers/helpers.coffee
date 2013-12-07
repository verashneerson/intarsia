define (require) ->
  Color = require 'helpers/color'

  do ->
    # supports 3- or 6-digit hex and rgb(a) values; no color names
    darken: (colorVal, percent = percent || 10) ->
      color = new Color colorVal
      return color.adjust(percent).toHex()

    lighten: (color, percent) ->
      @darken color, -percent
