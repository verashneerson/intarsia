define [
  'jquery'
  'backbone'
  'app'
  'handlebars'
  'text!templates/pattern_edit_form.html'
  ], ($, Backbone, App, Handlebars, template) ->
  class PatternFormEditView extends Backbone.View
    className: 'intarsia-pattern-form'
    template: Handlebars.compile template
    ###events:
      'click #reset': 'reset'
      'click #save': 'save'

    save: (evt) =>
      evt.preventDefault()

    reset: (evt) =>
      evt.preventDefault()
      App.vent.trigger('pattern:reset')###

    render: ->
      @$el.html @template @model.toJSON()
      @
