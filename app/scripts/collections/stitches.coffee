define ['backbone', 'models/stitch'], (Backbone, StitchModel) ->
  class StitchesCollection extends Backbone.Collection
    model: StitchModel
    url: '/json/grid.json'
