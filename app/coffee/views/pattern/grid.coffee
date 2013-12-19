define [
  'jquery'
  'underscore'
  'backbone'
  'app'
  'collections/stitches'
  'views/pattern/row'
  ], ($, _, Backbone, App, StitchesCollection, RowView) ->

  class GridView extends Backbone.View
    className: 'intarsia-grid'

    defaults:
      grid: []

    events:
      'mousedown'   : 'paint'
      'mouseup'     : 'stopPaint'
      'mouseleave'  : 'stopPaint'

    initialize: (options) ->
      @options = _.extend({}, @defaults, options)
      @listenTo App.vent, 'pattern_grid:remove', @remove

    removeItemViews: ->
      App.vent.trigger 'stitches_row:remove'
      App.vent.trigger 'stitch:remove'

    paint: (evt) => App.vent.trigger('mouse:dragging', true)
    stopPaint: (evt) => App.vent.trigger('mouse:dragging', false)

    addOne: (item, row) =>
      stitchRowCollection = new StitchesCollection(item)
      stitchRow = new RowView
        collection: stitchRowCollection
        row: row
      @$el.children('ul:first').append stitchRow.render().el

    addAll: ->
      @removeItemViews()
      @$el.html '<ul></ul>'
      for row in [0..@options.grid.length-1]
        @addOne @options.grid[row], row

    render: ->
      @addAll()

      @
