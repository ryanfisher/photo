namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.Manager = Backbone.View.extend({
    el: '.dashboard.index',

    events: {
      'click .album-view': 'switchToAlbumView',
      'click .photo-view': 'switchToPhotoView'
    },

    initialize: function() {
      // Set to scroll so there is no shifting when changing views
      $('html').css('overflow-y', 'scroll')
      this.currentView = new Fotio.Views.PhotoManager.Feed();
      new exports.AlbumDropdown();
    },

    switchToPhotoView: function() {
      this.switchViewTo(new exports.Feed());
    },

    switchToAlbumView: function() {
      this.switchViewTo(new exports.AlbumFeed());
    },

    switchViewTo: function(newView) {
      this.currentView.switchViewTo(newView);
      delete this.currentView
      this.currentView = newView;
    }
  });
});
