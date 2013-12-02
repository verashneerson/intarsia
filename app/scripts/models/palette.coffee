define ['backbone', 'underscore'], (Backbone, _) ->
  class PaletteModel extends Backbone.Model
    defaults: ->
      name: 'My Palette'
      colors: [
        'red','orange','yellow','green','blue','navy','purple'
        'white','silver','grey','black'
        'default' # eraser color
      ]

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)
