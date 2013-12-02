// Generated by CoffeeScript 1.6.3
var __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

define(['jquery', 'underscore', 'backbone', 'vent'], function($, _, Backbone, AppEvents) {
  var StitchView, _ref;
  return StitchView = (function(_super) {
    __extends(StitchView, _super);

    function StitchView() {
      this.reset = __bind(this.reset, this);
      this.setBrushColor = __bind(this.setBrushColor, this);
      this.setDragging = __bind(this.setDragging, this);
      this.paintContinuous = __bind(this.paintContinuous, this);
      this.recolor = __bind(this.recolor, this);
      this.paintStitch = __bind(this.paintStitch, this);
      _ref = StitchView.__super__.constructor.apply(this, arguments);
      return _ref;
    }

    StitchView.prototype.className = 'stitch-holder';

    StitchView.prototype.template = $('#stitch-template').html();

    StitchView.prototype.defaults = function() {
      return {
        color: 'default'
      };
    };

    StitchView.prototype.events = {
      'mousedown': 'paintStitch',
      'mouseenter': 'paintContinuous'
    };

    StitchView.prototype.initialize = function(options) {
      this.options = _.extend({}, this.defaults(), options);
      this.brushColor = this.defaultColor = this.defaults().color;
      this.dragging = false;
      this.listenTo(this.model, 'change:color', this.recolor, this);
      this.listenTo(AppEvents, 'swatch:select', this.setBrushColor);
      this.listenTo(AppEvents, 'mouse:dragging', this.setDragging);
      return this.listenTo(AppEvents, 'pattern:reset', this.reset);
    };

    StitchView.prototype.paintStitch = function(evt) {
      return this.model.paint(this.brushColor);
    };

    StitchView.prototype.recolor = function() {
      return this.$el.find('.stitch').removeClass().addClass("stitch " + (this.model.get('color')));
    };

    StitchView.prototype.paintContinuous = function() {
      if (this.dragging) {
        return this.paintStitch();
      }
    };

    StitchView.prototype.setDragging = function(dragging) {
      return this.dragging = dragging;
    };

    StitchView.prototype.setBrushColor = function(color) {
      return this.brushColor = color;
    };

    StitchView.prototype.reset = function(evt) {
      return this.model.erase();
    };

    StitchView.prototype.render = function() {
      this.$el.html(this.template);
      this.recolor();
      return this;
    };

    return StitchView;

  })(Backbone.View);
});
