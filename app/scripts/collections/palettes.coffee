define ['backbone', 'models/palette'], (Backbone, PaletteModel) ->
  class PalettesCollection extends Backbone.Collection
    model: PaletteModel
