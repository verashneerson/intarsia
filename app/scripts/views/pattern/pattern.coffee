define [
  'jquery'
  'underscore'
  'backbone'
  'app'
  'views/pattern/forms/edit'
  'views/palette/palette'
  'views/pattern/grid'
  'helpers/helpers'
  ], ($, _, Backbone, App, PatternFormEditView, PaletteView, GridView, helpers) ->

  class PatternView extends Backbone.View
    className: 'intarsia-pattern-edit'
    helpers: helpers

    events:
      'click #reset': 'reset'
      'click #save' : 'save'

    initialize: (options) ->
      @options = _.extend({}, @defaults, options)
      @listenTo App.vent, 'pattern:remove', @remove

    testColors: ->
      colorsEl = $('<div id="colors"></div>')
      colors = ['#990000', '#009900', '#009', '#ccc', '#999999', '#666666', 'FFFF00', '#ffffcc', "rgb(255,19, 23)", "rgb(122, 39, 144)", "rgba(122, 39, 144, 1)", "notacolor"]

      for color in colors
        rgb_dark = helpers.darken(color)
        console.log "#{color} / #{rgb_dark}"
        colorEl = $('<div></div>')
        colorEl.addClass('color-tester')
               .css({
                'background-color': color
                'border-color': rgb_dark
               })
               .appendTo($(colorsEl))

      $(colorsEl).append('<div class="clearfix">')
      for color in colors
        rgb_light = helpers.lighten(color, 25)
        console.log "#{color} / #{rgb_light}"
        colorEl = $('<div></div>')
        colorEl.addClass('color-tester')
               .css({
                'background-color': rgb_light
                'border-color': color
               })
               .appendTo($(colorsEl))

      $(colorsEl).append('<div class="clearfix">')

      @$el.append(colorsEl)
      false


    removeItemViews: ->
      App.vent.trigger 'pattern_grid:remove'
      App.vent.trigger 'palette:remove'
      App.vent.trigger 'pattern_edit:remove'

    save: (evt) =>
      evt.preventDefault()

    reset: (evt) =>
      evt.preventDefault()
      App.vent.trigger('pattern:reset')
      return false

    render: ->
      @removeItemViews()

      form = new PatternFormEditView model: @model
      @$el.append form.render().el

      # swatches
      palette = new PaletteView()
      @$el.append palette.render().el

      grid = new GridView grid: @model.get('grid')
      @$el.append grid.render().el

      palette.setDefaultColor()
      @testColors()
      @
