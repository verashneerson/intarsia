// Generated by CoffeeScript 1.6.3
var __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['underscore', 'backbone'], function(_, Backbone) {
  var PaletteModel, _ref;
  return PaletteModel = (function(_super) {
    __extends(PaletteModel, _super);

    function PaletteModel() {
      _ref = PaletteModel.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    PaletteModel.prototype.defaults = function() {
      return {
        name: 'My Palette',
        swatches: ['red', 'orange', 'yellow', 'green', 'blue', 'navy', 'purple', 'white', 'silver', 'grey', 'black', 'default']
      };
    };

    PaletteModel.prototype.initialize = function(options) {
      return this.options = _.extend({}, this.defaults(), options);
    };

    return PaletteModel;

  })(Backbone.Model);
});
