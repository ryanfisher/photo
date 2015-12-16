namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.BaseView = Backbone.View.extend({
    show: function() {
      this.$el.removeClass('hidden')
      setTimeout(_.bind(function() {
        this.$el.removeClass('changing')
      }, this), 10)
    },

    switchViewTo: function(newView) {
      this.$el.addClass('changing')
      var duration = this.$el.css('transition-duration');
      setTimeout(_.bind(function() {
        newView.show()
        this.$el.addClass('hidden');
        this.undelegateEvents();
        this.cleanUp();
      }, this), parseFloat(duration) * 1000);
    },

    // Perform extra cleanup when hiding view
    cleanUp: function() {}
  });
});
