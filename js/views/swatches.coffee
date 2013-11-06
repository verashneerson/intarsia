class Intarsia.Views.Swatches extends Backbone.View
  tagName: 'ul'
  className: 'intarsia-palette clearfix'

  initialize: ->
    @collection.on 'reset', @addAll
    @listenTo events, 'pattern:reset', @addAll

  # selects the first swatch in palette
  setDefaultColor: -> @$el.children(":first").find('a').click()

  # signals child views to clean up
  removeItemViews: -> events.trigger 'swatch:remove'

  addOne: (item) =>
    view = new Intarsia.Views.Swatch model: item
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

