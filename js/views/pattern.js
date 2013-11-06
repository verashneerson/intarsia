// Generated by CoffeeScript 1.6.3
var _ref,
  __bind = function(fn, me){ return function(){ return fn.apply(me, arguments); }; },
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

Intarsia.Views.Pattern = (function(_super) {
  __extends(Pattern, _super);

  function Pattern() {
    this.renderItem = __bind(this.renderItem, this);
    this.stopPaint = __bind(this.stopPaint, this);
    this.paint = __bind(this.paint, this);
    _ref = Pattern.__super__.constructor.apply(this, arguments);
    return _ref;
  }

  Pattern.prototype.collection = Intarsia.Collections.Stitches;

  Pattern.prototype.template = $("<div class='intarsia-grid'></div>");

  Pattern.prototype.templateRow = "<li class='pattern-row'></li>";

  Pattern.prototype.defaults = function() {
    return {
      width: 40,
      height: 20
    };
  };

  Pattern.prototype.events = {
    'mousedown': 'paint',
    'mouseup': 'stopPaint',
    'mouseleave': 'stopPaint'
  };

  Pattern.prototype.initialize = function() {
    this.options = _.extend({}, this.defaults(), this.options);
    this.palette = new Intarsia.Views.Palette;
    this.form = new Intarsia.Views.PatternForm({
      el: $('#pattern-form')
    });
    this.generate(this.options.height, this.options.width);
    return this.listenTo(this.collection, 'reset', this.render, this);
  };

  Pattern.prototype.generate = function(rows, cols) {
    var col, models, row, _i, _j;
    models = [];
    for (row = _i = 0; 0 <= rows ? _i <= rows : _i >= rows; row = 0 <= rows ? ++_i : --_i) {
      for (col = _j = 0; 0 <= cols ? _j <= cols : _j >= cols; col = 0 <= cols ? ++_j : --_j) {
        models.push(new Intarsia.Models.Stitch({
          row: row
        }));
      }
    }
    this.collection = new Intarsia.Collections.Stitches(models);
    return this.render();
  };

  Pattern.prototype.paint = function(evt) {
    return events.trigger('mouse:dragging', true);
  };

  Pattern.prototype.stopPaint = function(evt) {
    return events.trigger('mouse:dragging', false);
  };

  Pattern.prototype.renderItem = function(stitchModel, el) {
    var stitchView;
    stitchView = new Intarsia.Views.Stitch({
      model: stitchModel
    });
    return el.append(stitchView.render().el);
  };

  Pattern.prototype.render = function() {
    var item, row, rowColl, rowEl, uniqueRows, _i, _j, _len;
    this.$el.prepend(this.palette.render().el);
    uniqueRows = _.uniq(this.collection.pluck('row')).length || 0;
    for (row = _i = 0; 0 <= uniqueRows ? _i <= uniqueRows : _i >= uniqueRows; row = 0 <= uniqueRows ? ++_i : --_i) {
      rowColl = this.collection.where({
        row: row
      });
      rowEl = $(this.templateRow);
      for (_j = 0, _len = rowColl.length; _j < _len; _j++) {
        item = rowColl[_j];
        this.renderItem(item, rowEl);
      }
      this.template.append(rowEl);
    }
    this.$el.append(this.template);
    return this.palette.setDefaultColor();
  };

  return Pattern;

})(Backbone.View);
