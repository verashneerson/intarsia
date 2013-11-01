// Generated by CoffeeScript 1.6.3
var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Intarsia.Views.PatternForm = (function(_super) {
  __extends(PatternForm, _super);

  function PatternForm() {
    this.reset = __bind(this.reset, this);
    _ref = PatternForm.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  PatternForm.prototype.events = {
    'click #reset': 'reset'
  };

  PatternForm.prototype.reset = function(evt) {
    console.log("form reset");
    return events.trigger('pattern:reset');
  };

  return PatternForm;

})(Backbone.View);
