define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'models/stitch'
  'collections/stitches'
  'views/stitch'
  'views/palette'
  'views/pattern_form'
  ], ($, _, Backbone, AppEvents, StitchModel, StitchesCollection, StitchView, PaletteView, PatternFormView) ->

  class PatternView extends Backbone.View
    collection: StitchesCollection

    template: $("<div class='intarsia-grid'></div>")
    templateRow: "<li class='pattern-row'></li>"

    defaults: ->
      width: 40
      height: 20

    events:
      'mousedown': 'paint'
      'mouseup': 'stopPaint'
      'mouseleave': 'stopPaint'

    initialize: (options) ->
      @options = _.extend({}, @defaults(), options)

      @palette = new PaletteView()
      @form = new PatternFormView el: $('#pattern-form')
      @generate @options.height, @options.width # bootstrap w/ default dimensions
      #@collection.fetch()  #this is for saved collections

      @listenTo @collection, 'reset', @render, this

    # generate a grid with specified dimensions
    generate: (rows, cols) ->
      models = []
      for row in [0..rows]
        for col in [0..cols]
          models.push new StitchModel({ row: row })
      @collection = new StitchesCollection(models)
      @render()

    paint: (evt) => AppEvents.trigger('mouse:dragging', true)
    stopPaint: (evt) => AppEvents.trigger('mouse:dragging', false)

    # adds new Stitch view and appends it to specified element
    renderItem: (stitchModel, el) =>
      stitchView = new StitchView model: stitchModel
      el.append(stitchView.render().el)

    render: ->
      @$el.prepend(@palette.render().el)  # append swatches

      # separates rows of stiches
      uniqueRows = _.uniq(@collection.pluck('row')).length || 0
      for row in [0..uniqueRows]
        rowColl = @collection.where row: row  # gets stitches for current row
        rowEl = $(@templateRow)               # row element for view output
        # renders individual stitches and appends them to row
        @renderItem item, rowEl for item in rowColl
        @template.append(rowEl)

      @$el.append(@template)      # adds grid output to DOM
      @palette.setDefaultColor()
