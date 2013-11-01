// Generated by CoffeeScript 1.6.3
var _ref, _ref1,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Intarsia.Models.Stitch = (function(_super) {
  __extends(Stitch, _super);

  function Stitch() {
    _ref = Stitch.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Stitch.prototype.defaults = {
    color: 'default',
    row: 0
  };

  Stitch.prototype.initialize = function() {
    return this.options = _.extend({}, this.defaults, this.options);
  };

  return Stitch;

})(Backbone.Model);

Intarsia.Collections.Stitches = (function(_super) {
  __extends(Stitches, _super);

  function Stitches() {
    _ref1 = Stitches.__super__.constructor.apply(this, arguments);
    return _ref1;
  }

  Stitches.prototype.model = Intarsia.Models.Stitch;

  Stitches.prototype.url = '/json/grid.json';

  return Stitches;

})(Backbone.Collection);