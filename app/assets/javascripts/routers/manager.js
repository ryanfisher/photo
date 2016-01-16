namespace('Fotio.Routers', function(exports) {
  exports.Manager = Backbone.Router.extend({
    routes: {
      'albums': 'albums',
      'albums/:id': 'album',
      'photos': 'photos',
      '*path': 'redirectToPhotos'
    },

    albums: function() {
      this.setNav('.album-view');
      this.switchViewTo('AlbumsView', {});
    },

    album: function(id) {
      this.setNav('.album-view');
      var model = new Fotio.Models.User.Album({ id: id });
      this.switchViewTo('AlbumEditor', { model: model });
    },

    photos: function() {
      this.setNav('.photo-view');
      this.switchViewTo('PhotosView', {});
    },

    setNav: function(tab) {
      $('.nav-tabs li').removeClass('active')
      $('.nav-tabs').find(tab).addClass('active')
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
