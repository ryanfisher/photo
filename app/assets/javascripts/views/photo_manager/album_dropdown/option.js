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
      if (photos.length === 0) return this.showNoPhotosNotice();
      _.each(photos, this.model.addPhoto, this.model)
      this.model.save({}, {
        success: this.showSuccessNotice,
        error: this.showErrorNotice
      });
    },

    showSuccessNotice: function(model) {
      var message = 'Selected photos successfully added to album (' + model.get('title') + ').';
      Backbone.trigger('notice', { message: message });
    },

    showErrorNotice: function() {
      var message = 'There was an error adding the photos to the album.';
      Backbone.trigger('notice', { message: message, status: 'danger' });
    },

    showNoPhotosNotice: function() {
      var message = 'Must select photos to add to album.';
      Backbone.trigger('notice', { message: message, status: 'danger' });
    }
  })
});
