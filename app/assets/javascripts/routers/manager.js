namespace('Fotio.Routers', function(exports) {
  exports.Manager = Backbone.Router.extend({
    routes: {
      'albums': 'albums',
      'albums/:id': 'album',
      'photos': 'photos',
      '*path': 'redirectToPhotos'
    },

    albums: function() {
      this.switchViewTo('AlbumsView', {});
    },

    album: function(id) {
      var model = new Fotio.Models.User.Album({ id: id });
      this.switchViewTo('AlbumEditor', { model: model });
    },

    photos: function() {
      this.switchViewTo('PhotosView', {});
    },

    redirectToPhotos: function() {
      this.navigate('photos', { trigger: true, replace: true });
    },

    switchViewTo: function(viewClass, options) {
      var namespace = Fotio.Views.PhotoManager;
      Fotio.Views.PhotoManager.switchViewTo(namespace[viewClass], options);
    }
  })
});
