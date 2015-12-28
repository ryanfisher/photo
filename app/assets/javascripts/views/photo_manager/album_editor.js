//= require ./base_view

namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumEditor = exports.BaseView.extend({
    el: '#album-editor',

    initialize: function() {
      this.listenTo(this.model, 'sync', this.render);
      this.model.fetch();
    },

    render: function() {
      this.collection = this.model.get('photos');
      this.feed = new exports.PhotoFeed({
        el: this.$('.feed'),
        collection: this.collection
      });
      this.feed.render();
      this.$('.feed').sortable({
        stop: _.bind(this.savePositions, this)
      });
    },

    savePositions: function() {
      _.invoke(this.feed.photoEditViews, 'updatePosition');
      var positions = this.collection.positions(this.model.id);
      $.post('/api/sorted_photos/update_positions', { positions: positions });
    },

    cleanUp: function() {
      this.feed.removePhotoViews();
    }
  });
});
