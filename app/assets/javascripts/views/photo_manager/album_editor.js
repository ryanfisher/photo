//= require ./base_view

namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumEditor = exports.BaseView.extend({
    el: '#album-editor',

    initialize: function() {
      this.feed = new exports.PhotoFeed({
        el: this.$('.feed'),
        collection: this.model.get('photos')
      });
      this.feed.render();
    },
  });
});
