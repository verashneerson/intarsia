define [
  'jquery'
  'underscore'
  'backbone'
  'vent'
  'views/swatch'
  ], ($, _, Backbone, AppEvents, SwatchView) ->
  class SwatchesView extends Backbone.View
    tagName: 'ul'
    className: 'intarsia-palette clearfix'

    initialize: (options) ->
      @collection.on 'reset', @addAll
      @listenTo AppEvents, 'pattern:reset', @addAll

    # selects the first swatch in palette
    setDefaultColor: -> @$el.children(":first").find('a').click()

    # signals child views to clean up
    removeItemViews: -> AppEvents.trigger 'swatch:remove'

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

