define [
  'jquery'
  'underscore'
  'backbone'
  'app'
  'text!templates/stitch.html'
  ], ($, _, Backbone, App, template) ->

  class StitchView extends Backbone.View
    tagName: 'li'
    className: 'stitch-holder'
    template: template

    defaults: ->
      color: 'default'

    events:
      'mousedown': 'paintStitch'
      'mouseenter': 'paintContinuous'

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)
      @brushColor = @defaultColor = @defaults().color
      @dragging = false

      @listenTo @model, 'change:color', @recolor, this

      # listens for palette color selection changes
      @listenTo App.vent, 'swatch:select', @setBrushColor

      # listens for mouse dragging on parent canvas
      @listenTo App.vent, 'mouse:dragging', @setDragging

      # reset event sets all stitches to default color
      @listenTo App.vent, 'pattern:reset', @reset

      @listenTo App.vent, 'stitch:remove', @remove

    # model decides which color to paint
    paintStitch: (evt) => @model.paint @brushColor

    # changes stitch color (on model update)
    recolor: => @$el.find('.stitch').removeClass()
      .addClass("stitch #{ @model.get 'color' }")

    # paints stitch only if mouse is held down
    paintContinuous: => @paintStitch() if @dragging

    # sets mouse dragging property to imitate onmousedrag
    setDragging: (dragging) => @dragging = dragging

    # sets current brush color
    setBrushColor: (color) => @brushColor = color

    reset: (evt) => @model.erase()

    render: ->
      # use Modernizr to check for svg support
      @$el.html(@template)
      @recolor()  # init saved colors
      this
