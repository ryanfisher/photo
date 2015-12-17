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
      _.invoke(this.options, 'remove');
      this.options = this.collection.map(this.appendOption, this)
    },

    appendOption: function(model) {
      var option = new exports.AlbumDropdown.Option({ model: model })
      option.feed = this.feed;
      this.$('.options').append(option.$el);
      return option;
    },

    createAlbum: function() {
      var modal = new exports.AlbumModal({ collection: this.collection });
      modal.show();
    }
  })
});
