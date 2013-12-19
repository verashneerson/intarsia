define ['backbone', 'models/palette', 'backbone.localStorage'], (Backbone, PatternModel) ->
  class PatternsCollection extends Backbone.Collection
    model: PatternModel
    url: new Backbone.LocalStorage("IntarsiaPatterns")
