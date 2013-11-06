class Intarsia.Views.Swatches extends Backbone.View
  tagName: 'ul'
  className: 'intarsia-palette clearfix'

  initialize: ->
    @collection.on 'reset', @addAll
    @listenTo events, 'pattern:reset', @addAll

  # selects the first swatch in palette
  setDefaultColor: ->
    @$el.children(":first").find('a').click()

  removeItemViews: ->
    # let the children know it's time to put away their toys.
    @trigger 'clean_up'

  addOne: (item) =>
    view = new Intarsia.Views.Swatch model: item

    # the item view will listen for the clean_up event on the list_view
    # and clean up after itself and remove itself from the DOM
    view.listenTo this, 'clean_up', view.remove
    @$el.append view.render().el

  addAll: ->
    # clear out any existing Swatch views when resetting the collection
    @removeItemViews()
    @collection.each @addOne, this

  remove: ->
    # when this view is being removed, it should clean up its children
    @removeItemViews()
    super()

  render: ->
    @addAll()
    @setDefaultColor()
    this

