namespace('Fotio.Routers', function(exports) {
  exports.Manager = Backbone.Router.extend({
    routes: {
      'albums': 'albums',
      'albums/:id': 'album',
      'photos': 'photos',
      '*path': 'redirectToPhotos'
    },

    albums: function() {
      var namespace = Fotio.Views.PhotoManager;
      namespace.switchViewTo(namespace.AlbumsView);
    },

    photos: function() {
      var namespace = Fotio.Views.PhotoManager;
      namespace.switchViewTo(namespace.PhotosView);
    },

    redirectToPhotos: function() {
      this.navigate('photos', { trigger: true, replace: true });
    }
  })
});
