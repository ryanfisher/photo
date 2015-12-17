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
      this.currentView = new exports.Feed();
    },

    switchToPhotoView: function() {
      this.switchViewTo(exports.Feed);
    },

    switchToAlbumView: function() {
      this.switchViewTo(exports.AlbumFeed);
    },

    switchViewTo: function(viewClass) {
      if ('#' + this.currentView.el.id == viewClass.prototype.el) return;
      var newView = new viewClass()
      this.currentView.switchViewTo(newView);
      delete this.currentView
      this.currentView = newView;
    }
  });
});
