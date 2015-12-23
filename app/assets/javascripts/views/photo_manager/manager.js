//= require ./../../routers/manager

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
      exports.currentView = new exports.BaseView();
      this.router = new Fotio.Routers.Manager();
      Backbone.history.start({ pushState: true, root: '/dashboard/' });
    },

    switchToPhotoView: function() {
      this.router.navigate('photos', { trigger: true });
    },

    switchToAlbumView: function() {
      this.router.navigate('albums', { trigger: true });
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
