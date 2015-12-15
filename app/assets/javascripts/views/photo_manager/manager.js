namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.Manager = Backbone.View.extend({
    el: '.dashboard.index',

    events: {
      'click .option.delete': 'deletePhotos',
      'click .album-view': 'switchToAlbumView'
    },

    initialize: function() {
      this.collection = new Fotio.Collections.User.SortablePhotos();
      this.feed =
        new Fotio.Views.PhotoManager.Feed({ collection: this.collection });
      this.collection.fetch();
      new exports.AlbumDropdown();
    },

    deletePhotos: function() {
      var confirmText = 'Are you sure you want to delete the selected photos?';
      if (!confirm(confirmText)) return;
      _.invoke(this.feed.selected_photos(), 'destroy')
    },

    showAlbumView: function() {
      this.feed.$el.removeClass('changing')
    },

    switchToAlbumView: function() {
      this.feed.$el.addClass('changing')
      setTimeout(_.bind(this.showAlbumView, this), 1000)
    }
  });
});
