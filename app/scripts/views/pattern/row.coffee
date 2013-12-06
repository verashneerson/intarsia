define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'models/stitch'
  'views/pattern/stitch'
  ], ($, _, Backbone, AppEvents, StitchModel, StitchView) ->

  class RowView extends Backbone.View
    tagName: 'li'
    className: 'pattern-row'

    initialize: ->
      @collection.on 'reset', @addAll, this
      @listenTo AppEvents, "stitches_row:remove", @remove

    addOne: (item) =>
      stitchView = new StitchView model: item
      @$el.children('ul:first').append stitchView.render().el

    addAll: ->
      @$el.html "<ul></ul>"
      @collection.each @addOne

    render: ->
      @addAll()
      @

