namespace('Fotio.Views.Photo', function(exports) {
  exports.Row = Backbone.View.extend({
    DEFAULT_HEIGHT: 350,
    DEFAULT_MARGIN: 15,

    initialize: function() {
      this.views = [];
    },

    width: function() {
      var defaultHeight = this.DEFAULT_HEIGHT;
      return _.reduce(this.views, function(sum, view) {
        return sum + view.$el.width();
      }, 0) + this.marginSpacing();
    },

    marginSpacing: function() {
      return (this.views.length - 1) * this.DEFAULT_MARGIN;
    },

    adjustWidth: function(desiredWidth) {
      var ratio = desiredWidth / this.width();
      var defaultHeight = this.DEFAULT_HEIGHT;
      _.each(this.views, function(view) {
        view.set_height(parseInt(defaultHeight * ratio));
        view.$el.css('margin-right', '');
      });
      // Expand the last image slightly to take up any remaining difference
      var diff = this.width() - desiredWidth;
      var last = _.last(this.views)
      last.$el.width(last.$el.width() - diff - 1);
      last.$el.css('margin-right', 0);
    },

    append: function(view) {
      view.set_height(this.DEFAULT_HEIGHT);
      this.views.push(view);
    }
  });
});
