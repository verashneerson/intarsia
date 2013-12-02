define [
  'jquery'
  'backbone'
  'vent'
  ], ($, Backbone, AppEvents) ->
  class PatternFormView extends Backbone.View
    events:
      'click #reset': 'reset'

    reset: (evt) =>
      console.log "form reset"
      AppEvents.trigger('pattern:reset')
