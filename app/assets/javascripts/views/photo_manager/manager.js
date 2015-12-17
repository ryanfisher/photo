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
      exports.currentView = new exports.Feed();
    },

    switchToPhotoView: function() {
      exports.switchViewTo(exports.Feed);
    },

    switchToAlbumView: function() {
      exports.switchViewTo(exports.AlbumFeed);
    },
  });

  exports.switchViewTo = function(viewClass, options) {
    if ('#' + exports.currentView.el.id == viewClass.prototype.el) return;
    var newView = new viewClass(options)
    exports.currentView.switchViewTo(newView);
    delete exports.currentView
    exports.currentView = newView;
  };
});
