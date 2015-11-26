namespace('Fotio.Views.Photo', function(exports) {
  exports.Row = Backbone.View.extend({
    className: 'row',

    DEFAULT_HEIGHT: 350,

    initialize: function() {
      this.views = [];
    },

    width: function() {
      var defaultHeight = this.DEFAULT_HEIGHT;
      return _.reduce(this.views, function(sum, view) {
        return sum + view.model.width_from(defaultHeight) + 15;
      }, 0);
    },

    adjustWidth: function(desiredWidth) {
      var ratio = desiredWidth / this.width();
      var defaultHeight = this.DEFAULT_HEIGHT;
      _.each(this.views, function(view) {
        view.set_height(defaultHeight * ratio);
      });
    },

    append: function(view) {
      this.$el.append(view.$el)
      this.views.push(view);
    }
  });
});
