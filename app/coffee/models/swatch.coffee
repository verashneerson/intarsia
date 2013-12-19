define ['backbone', 'underscore'], (Backbone, _) ->
  class SwatchModel extends Backbone.Model
    defaults: ->
      color: 'default'

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)

