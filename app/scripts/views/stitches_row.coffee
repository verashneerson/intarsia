define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'models/stitch'
  'views/stitch'
  ], ($, _, Backbone, AppEvents, StitchModel, StitchView) ->

  class StitchesRowView extends Backbone.View
    tagName: 'li'
    className: 'pattern-row'

    initialize: ->
      @collection.on 'reset', @addAll, this
      @listenTo AppEvents, "stitches_row:remove", @remove

    addOne: (item) =>
      stitchView = new StitchView model: item
      @$el.append stitchView.render().el

    addAll: ->
      @collection.each @addOne

    render: ->
      @addAll()
      @

