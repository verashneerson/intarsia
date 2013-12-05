define ['underscore', 'backbone'], (_, Backbone) ->
  class PatternModel extends Backbone.Model
    defaults: ->
      name: 'My Pattern'
      width: 30
      height: 20
      grid: []

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)
