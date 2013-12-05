define [
  'jquery'
  'backbone'
  'vent'
  'text!templates/pattern_create_form.html'
  ], ($, Backbone, AppEvents, template) ->
  class PatternCreateView extends Backbone.View
    className: 'intarsia-pattern-form'
    template: template
    events:
      'click #reset': 'reset'
      'click #create': 'create'

    create: (evt) =>
      evt.preventDefault();

    reset: (evt) =>
      evt.preventDefault();
      AppEvents.trigger('pattern:reset')

    render: ->
      @$el.html @template
      @
