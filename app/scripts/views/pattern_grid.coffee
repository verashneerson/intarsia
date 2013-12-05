define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'collections/stitches'
  'views/stitches_row'
  ], ($, _, Backbone, AppEvents, StitchesCollection, StitchesRowView) ->

  class PatternGrid extends Backbone.View
    className: 'intarsia-grid'

    defaults:
      grid: []

    events:
      'mousedown'   : 'paint'
      'mouseup'     : 'stopPaint'
      'mouseleave'  : 'stopPaint'

    initialize: (options) ->
      @options = _.extend({}, @defaults, options)
      @listenTo AppEvents, 'pattern_grid:remove', @remove

    removeItemViews: ->
      AppEvents.trigger 'stitches_row:remove'
      AppEvents.trigger 'stitch:remove'

    paint: (evt) => AppEvents.trigger('mouse:dragging', true)
    stopPaint: (evt) => AppEvents.trigger('mouse:dragging', false)

    addOne: (item, row) =>
      stitchRowCollection = new StitchesCollection(item)
      stitchRow = new StitchesRowView
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
