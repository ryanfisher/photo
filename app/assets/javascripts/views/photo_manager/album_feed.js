//= require ./base_view

namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumFeed = exports.BaseView.extend({
    el: '#album-manager-feed',

    initialize: function() {
      this.collection = new Fotio.Collections.User.Albums()
      this.listenTo(this.collection, 'sync', this.render)
      this.collection.fetch();
    },

    render: function() {
      this.collection.each(_.bind(this.appendAlbum, this))
    },

    appendAlbum: function(model) {
      var album = $('<div>', { text: model.get('title'), class: 'album-cover' });
      album.append($('<i>', { class: 'fa fa-folder' }));
      album.on('click', function() {
        exports.switchViewTo(exports.AlbumEditor, { model: model });
      });
      this.$('.feed').append(album)
    },

    cleanUp: function() {
      this.$('.album-cover').remove()
    }
  });
});
