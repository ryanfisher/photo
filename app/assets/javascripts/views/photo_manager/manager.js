namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.Manager = Backbone.View.extend({
    el: '.dashboard.index',

    events: {
      'click .option.delete': 'deletePhotos',
      'click .album-view': 'switchToAlbumView',
      'click .photo-view': 'switchToPhotoView'
    },

    initialize: function() {
      this.collection = new Fotio.Collections.User.SortablePhotos();
      this.currentView =
        new Fotio.Views.PhotoManager.Feed({ collection: this.collection });
      this.collection.fetch();
      new exports.AlbumDropdown();
    },

    deletePhotos: function() {
      var confirmText = 'Are you sure you want to delete the selected photos?';
      if (!confirm(confirmText)) return;
      _.invoke(this.feed.selected_photos(), 'destroy')
    },

    switchToPhotoView: function() {
      this.switchViewTo(new exports.Feed({ collection: this.collection }));
    },

    switchToAlbumView: function() {
      this.switchViewTo(new exports.AlbumFeed());
    },

    switchViewTo: function(newView) {
      this.currentView.switchViewTo(newView);
      this.currentView = newView;
    }
  });
});
