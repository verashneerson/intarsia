// Generated by CoffeeScript 1.6.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'backbone', 'vent', 'models/stitch', 'views/stitch'], function($, _, Backbone, AppEvents, StitchModel, StitchView) {
  var StitchesRowView, _ref;
  return StitchesRowView = (function(_super) {
    __extends(StitchesRowView, _super);

    function StitchesRowView() {
      this.addOne = __bind(this.addOne, this);
      _ref = StitchesRowView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    StitchesRowView.prototype.tagName = 'li';

    StitchesRowView.prototype.className = 'pattern-row';

    StitchesRowView.prototype.initialize = function() {
      this.collection.on('reset', this.addAll, this);
      return this.listenTo(AppEvents, "stitches_row:remove", this.remove);
    };

    StitchesRowView.prototype.addOne = function(item) {
      var stitchView;
      stitchView = new StitchView({
        model: item
      });
      return this.$el.children('ul:first').append(stitchView.render().el);
    };

    StitchesRowView.prototype.addAll = function() {
      this.$el.html("<ul></ul>");
      return this.collection.each(this.addOne);
    };

    StitchesRowView.prototype.render = function() {
      this.addAll();
      return this;
    };

    return StitchesRowView;

  })(Backbone.View);
});
