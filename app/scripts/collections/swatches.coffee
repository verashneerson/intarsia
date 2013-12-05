define [
  'backbone'
  'models/swatch'
], (Backbone, SwatchModel) ->
  class SwatchesCollection extends Backbone.Collection
    model: SwatchModel
