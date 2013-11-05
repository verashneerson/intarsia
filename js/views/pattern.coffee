class Intarsia.Views.Pattern extends Backbone.View
  collection: Intarsia.Collections.Stitches

  template: $("<div class='intarsia-grid'></div>")
  templateRow: "<li class='pattern-row'></li>"

  defaults: ->
    width: 40
    height: 20

  events:
    'mousedown': 'paint'
    'mouseup': 'stopPaint'
    'mouseleave': 'stopPaint'

  initialize: ->
    @options = _.extend({}, @defaults(), @options)
    @form = new Intarsia.Views.PatternForm el: $('#pattern-form')
    @generate @options.height, @options.width # bootstrap w/ default dimensions
    #@collection.fetch()  #this is for saved collections

    @collection.on 'reset', @render, this
    events.on 'pattern:reset', @addSwatches, this

  addSwatches: (evt) =>
    if @palette?    # remove current palette if exists
      @palette.off()
      @palette.remove()
    @palette = new Intarsia.Views.Swatches() #colors: ['red', 'black', 'white', 'default']
    @$el.prepend(@palette.render().el)  # append swatches

  # generate a grid with specified dimensions
  generate: (rows, cols) ->
    models = []
    for row in [0..rows]
      for col in [0..cols]
        models.push new Intarsia.Models.Stitch({ row: row })
    @collection = new Intarsia.Collections.Stitches(models)
    @render()

  paint: (evt) => events.trigger('mouse:dragging', true)

  stopPaint: (evt) => events.trigger('mouse:dragging', false)

  # adds new Stitch view and appends it to specified element
  renderItem: (stitchModel, el) =>
    stitchView = new Intarsia.Views.Stitch model: stitchModel
    el.append(stitchView.render().el)

  render: ->
    @addSwatches()

    # separates rows of stiches
    uniqueRows = _.uniq(@collection.pluck('row')).length || 0
    for row in [0..uniqueRows]
      rowColl = @collection.where row: row  # gets stitches for current row
      rowEl = $(@templateRow)               # row element for view output
      # renders individual stitches and appends them to row
      @renderItem item, rowEl for item in rowColl
      @template.append(rowEl)

    @$el.append(@template)      # adds grid output to DOM
    @palette.setDefaultColor()  # init brush color for stitches
