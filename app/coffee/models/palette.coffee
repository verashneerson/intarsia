define ['underscore', 'backbone'], (_, Backbone) ->
  class PaletteModel extends Backbone.Model
    defaults: ->
      name: 'My Palette'
      swatches: [
        'red','orange','yellow','green','blue','navy','purple'
        'white','silver','grey','black', 'default' # eraser color
      ]

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)
      #@swatches = new SwatchesCollection(this.get('swatches'))
