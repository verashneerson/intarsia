class Intarsia.Views.Stitch extends Backbone.View

  model: Intarsia.Models.Stitch

  tagName: 'div'
  template: $('#stitch-template').html()

  defaults:
    color: 'default'

  events:
    'mousedown': 'chooseColor'
    'mouseenter': 'paintContinuous'

  initialize: ->
    @options = _.extend({}, @defaults, @options)
    @brushColor = @defaultColor = @defaults.color
    @dragging = false

    @model.on 'change', @paint, this

    # listens for palette color selection changes
    events.on 'palette:change', @setBrushColor, this

    # listens for mouse dragging on parent canvas
    events.on 'mouse:dragging', @setDragging, this

    # reset event sets all stitches to default color
    events.on 'pattern:reset', @reset

  # model operations
  getColor: -> @model.get 'color'
  setColor: (color) -> @model.set color: color

  # choose which color to use (use default if it's already set to brush colçor)
  chooseColor: (evt) =>
    color = if @getColor() is @brushColor then @defaultColor else @brushColor
    @setColor(color)

  # change stitch color (on model update)
  paint: => @$el.find('.stitch').removeClass().addClass("stitch #{@getColor()}")

  # paint stitch only if mouse is held down
  paintContinuous: (dragging) => @chooseColor() if @dragging

  # sets mouse dragging property to imitate onmousedrag
  setDragging: (dragging) => @dragging = dragging

  # current brush color
  setBrushColor: (color) => @brushColor = color

  reset: (evt) => @setColor(@defaultColor)

  render: ->
    # use Modernizr to check for svg support
    @$el.addClass("stitch-holder").html(@template)
    @paint()  # init saved colors
