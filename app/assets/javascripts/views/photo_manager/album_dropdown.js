namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumDropdown = Backbone.View.extend({
    el: '.album-choices',

    events: {
      'click .create-album': 'createAlbum'
    },

    initialize: function() {
      this.collection = new Fotio.Collections.User.Albums()
      this.listenTo(this.collection, 'sync', this.render)
      this.collection.fetch();
    },

    render: function() {
      this.collection.each(this.appendOption, this)
    },

    appendOption: function(model) {
      var option = new exports.AlbumDropdown.Option({ model: model })
      this.$('.options').append(option.$el);
    },

    createAlbum: function() {
      var modal = new exports.AlbumModal({ collection: this.collection });
      modal.show();
    }
  })
});
