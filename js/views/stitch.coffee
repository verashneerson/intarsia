class Intarsia.Views.Stitch extends Backbone.View

  model: Intarsia.Models.Stitch

  tagName: 'div'
  className: 'stitch-holder'
  template: $('#stitch-template').html()

  defaults: ->
    color: 'default'

  events:
    'mousedown': 'paintStitch'
    'mouseenter': 'paintContinuous'

  initialize: ->
    @options = _.extend({}, @defaults(), @options)
    @brushColor = @defaultColor = @defaults().color
    @dragging = false

    @model.on 'change', @recolor, this

    # listens for palette color selection changes
    events.on 'palette:change', @setBrushColor, this

    # listens for mouse dragging on parent canvas
    events.on 'mouse:dragging', @setDragging, this

    # reset event sets all stitches to default color
    events.on 'pattern:reset', @reset

  # model operations
  getColor: -> @model.get 'color'

  # model decides which color to paint
  paintStitch: (evt) => @model.paint @brushColor

  # changes stitch color (on model update)
  recolor: => @$el.find('.stitch').removeClass().addClass("stitch #{@getColor()}")

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
    return this
