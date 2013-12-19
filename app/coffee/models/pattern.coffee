define ['underscore', 'backbone'], (_, Backbone) ->
  class PatternModel extends Backbone.Model
    defaults: ->
      name: 'My Pattern'
      width: 0
      height: 0
      grid: []

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)
