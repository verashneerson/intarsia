// Generated by CoffeeScript 1.6.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'backbone', 'vent', 'views/swatch'], function($, _, Backbone, AppEvents, SwatchView) {
  var SwatchesView, _ref;
  return SwatchesView = (function(_super) {
    __extends(SwatchesView, _super);

    function SwatchesView() {
      this.addOne = __bind(this.addOne, this);
      _ref = SwatchesView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    SwatchesView.prototype.tagName = 'ul';

    SwatchesView.prototype.className = 'intarsia-palette clearfix';

    SwatchesView.prototype.initialize = function(options) {
      this.collection.on('reset', this.addAll);
      return this.listenTo(AppEvents, 'pattern:reset', this.addAll);
    };

    SwatchesView.prototype.setDefaultColor = function() {
      return this.$el.children(":first").children('a:first').click();
    };

    SwatchesView.prototype.removeItemViews = function() {
      return AppEvents.trigger('swatch:remove');
    };

    SwatchesView.prototype.addOne = function(item) {
      var view;
      view = new SwatchView({
        model: item
      });
      return this.$el.append(view.render().el);
    };

    SwatchesView.prototype.addAll = function() {
      this.removeItemViews();
      this.collection.each(this.addOne, this);
      return this.setDefaultColor();
    };

    SwatchesView.prototype.remove = function() {
      this.removeItemViews();
      return SwatchesView.__super__.remove.call(this);
    };

    SwatchesView.prototype.render = function() {
      this.addAll();
      return this;
    };

    return SwatchesView;

  })(Backbone.View);
});
