class Intarsia.Models.Stitch extends Backbone.Model
  defaults:
    color: 'default'
    row: 0

  initialize: ->
    @options = _.extend({}, @defaults, @options)

class Intarsia.Collections.Stitches extends Backbone.Collection
  model: Intarsia.Models.Stitch
  url: '/json/grid.json'
