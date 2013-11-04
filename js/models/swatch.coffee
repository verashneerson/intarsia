class Intarsia.Models.Swatch extends Backbone.Model
  defaults: ->
    color: 'default'

  initialize: ->
    @options = _.extend({}, @defaults(), @options)

class Intarsia.Collections.Swatches extends Backbone.Collection
  model: Intarsia.Models.Swatch
