define [
  'jquery'
  'underscore'
  'backbone'
  'app'
  'views/palette/swatch'
  ], ($, _, Backbone, App, SwatchView) ->
  class SwatchesView extends Backbone.View
    tagName: 'ul'
    className: 'intarsia-palette clearfix'

    initialize: (options) ->
      @collection.on 'reset', @addAll
      @listenTo App.vent, 'pattern:reset', @addAll

    # selects the first swatch in palette
    setDefaultColor: -> @$el.children(":first").children('a:first').click()

    # signals child views to clean up
    removeItemViews: -> App.vent.trigger 'swatch:remove'

    addOne: (item) =>
      view = new SwatchView model: item
      @$el.append view.render().el

    addAll: ->
      # clear out any existing Swatch views when resetting the collection
      @removeItemViews()
      @collection.each @addOne, this
      @setDefaultColor()

    # when this view is being removed, it should clean up its children
    remove: ->
      @removeItemViews()
      super()

    render: ->
      @addAll()
      this

