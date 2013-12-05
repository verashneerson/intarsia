define ['backbone', 'models/palette', 'backbone.localStorage'], (Backbone, PaletteModel) ->
  class PalettesCollection extends Backbone.Collection
    model: PaletteModel
    url: new Backbone.LocalStorage("IntarsiaPalettes")
