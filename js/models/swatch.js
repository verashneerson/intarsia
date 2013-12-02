// Generated by CoffeeScript 1.6.3
var _ref, _ref1,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Intarsia.Models.Swatch = (function(_super) {
  __extends(Swatch, _super);

  function Swatch() {
    _ref = Swatch.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Swatch.prototype.defaults = function() {
    return {
      color: 'default'
    };
  };

  Swatch.prototype.initialize = function(options) {
    return this.options = _.extend({}, this.defaults(), options);
  };

  return Swatch;

})(Backbone.Model);

Intarsia.Collections.Swatches = (function(_super) {
  __extends(Swatches, _super);

  function Swatches() {
    _ref1 = Swatches.__super__.constructor.apply(this, arguments);
    return _ref1;
  }

  Swatches.prototype.model = Intarsia.Models.Swatch;

  return Swatches;

})(Backbone.Collection);
