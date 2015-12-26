namespace('Fotio.Views.PhotoManager.AlbumDropdown', function(exports) {
  exports.Option = Backbone.View.extend({
    className: 'option album',

    events: {
      'click': 'addSelectedPhotos'
    },

    initialize: function() {
      this.render();
    },

    render: function() {
      this.$el.text(this.model.get('title'));
    },

    addSelectedPhotos: function() {
      var photos = this.feed.selected_photos();
      if (photos.length === 0) return this.showErrorNotice();
      _.each(photos, this.model.addPhoto, this.model)
      this.model.save()
    },

    showErrorNotice: function() {
      var message = 'Must select photos to add to album.';
      Backbone.trigger('notice', { message: message, status: 'danger' });
    }
  })
});
