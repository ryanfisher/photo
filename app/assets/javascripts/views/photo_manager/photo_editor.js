//= require ./base_view

namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.PhotoEditor = exports.BaseView.extend({
    el: '#photo-editor',

    initialize: function() {
      this.model.fetch({
        url: '/api/photos/' + this.model.id,
        success: _.bind(this.render, this)
      });
    },

    render: function() {
      this.$('.photo-container img').prop('src', this.model.thumbnail());
    }
  });
});
