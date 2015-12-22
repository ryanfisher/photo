namespace('Fotio.Routers', function(exports) {
  exports.Manager = Backbone.Router.extend({
    routes: {
      'albums': 'albums',
      'albums/:id': 'album'
    },

    albums: function() {
      var namespace = Fotio.Views.PhotoManager;
      namespace.switchViewTo(namespace.AlbumsView);
    }
  })
});
