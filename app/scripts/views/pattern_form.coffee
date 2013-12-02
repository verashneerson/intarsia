class Intarsia.Views.PatternForm extends Backbone.View
  events:
    'click #reset': 'reset'

  reset: (evt) =>
    console.log "form reset"
    events.trigger('pattern:reset')
