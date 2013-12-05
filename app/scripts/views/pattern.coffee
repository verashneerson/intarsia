define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'views/pattern_edit_form'
  'views/palette'
  'views/pattern_grid'
  ], ($, _, Backbone, AppEvents, PatternEditFormView, PaletteView, PatternGrid) ->

  class PatternView extends Backbone.View
    className: 'intarsia-pattern-edit'

    events:
      'click #reset': 'reset'
      'click #save' : 'save'

    initialize: (options) ->
      @options = _.extend({}, @defaults, options)
      @listenTo AppEvents, 'pattern:remove', @remove

    removeItemViews: ->
      AppEvents.trigger 'pattern_grid:remove'
      AppEvents.trigger 'palette:remove'
      AppEvents.trigger 'pattern_edit:remove'

    save: (evt) =>
      evt.preventDefault()

    reset: (evt) =>
      evt.preventDefault()
      AppEvents.trigger('pattern:reset')
      return false

    render: ->
      @removeItemViews()

      form = new PatternEditFormView model: @model
      @$el.append form.render().el

      # swatches
      palette = new PaletteView()
      @$el.append palette.render().el

      grid = new PatternGrid grid: @model.get('grid')
      @$el.append grid.render().el

      palette.setDefaultColor()

      @
