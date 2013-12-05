define [
  'jquery'
  'backbone'
  'vent'
  'handlebars'
  'text!templates/pattern_edit_form.html'
  ], ($, Backbone, AppEvents, Handlebars, template) ->
  class PatternEditFormView extends Backbone.View
    className: 'intarsia-pattern-form'
    template: Handlebars.compile template
    ###events:
      'click #reset': 'reset'
      'click #save': 'save'

    save: (evt) =>
      evt.preventDefault()

    reset: (evt) =>
      evt.preventDefault()
      AppEvents.trigger('pattern:reset')###

    render: ->
      @$el.html @template @model.toJSON()
      @
