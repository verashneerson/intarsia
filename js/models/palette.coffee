class Intarsia.Models.Palette extends Backbone.Model
  defaults: ->
    name: 'My Palette'
    colors: [
      'red','orange','yellow','green','blue','navy','purple'
      'white','silver','grey','black'
      'default' # eraser color
    ]

  initialize: ->
    @options = _.extend({}, @defaults(), @options)

class Intarsia.Collections.Palettes extends Backbone.Collection
  model: Intarsia.Models.Palette
