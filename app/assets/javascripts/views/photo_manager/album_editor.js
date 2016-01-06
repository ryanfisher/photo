//= require ./base_view

namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumEditor = exports.BaseView.extend({
    el: '#album-editor',

    events: {
      'click .option.delete': 'deleteAlbum',
      'click .option.change-title': 'changeTitle',
      'click .option.remove-selected': 'removePhotos'
    },

    initialize: function() {
      this.model.fetch({ success: _.bind(this.render, this) });
      this.listenTo(this.model, 'change:title', this.setTitle);
    },

    render: function() {
      this.setTitle()
      this.collection = this.model.get('photos');
      this.feed = new exports.PhotoFeed({
        el: this.$('.feed'),
        collection: this.collection
      });
      this.feed.render();
      this.$('.feed').sortable({
        stop: _.bind(this.savePositions, this)
      });
    },

    setTitle: function() {
      this.$('.title').text(this.model.get('title'));
    },

    savePositions: function() {
      _.invoke(this.feed.photoEditViews, 'updatePosition');
      // TODO: Make request only when model has changed
      _.invoke(this.collection.models, 'save');
      this.updateNotice()
    },

    deleteAlbum: function() {
      var text = 'Are you sure you want to delete this album? This action is cannot be undone.';
      if (!confirm(text)) return;
      this.model.destroy({ success: function() {
        Fotio.router.navigate('albums', { trigger: true });
      }});
    },

    changeTitle: function() {
      var modal = new exports.AlbumModal({ model: this.model });
      modal.show();
    },

    updateNotice: function() {
      Backbone.trigger('notice', { message: 'Positions successfully updated.' });
    },

    cleanUp: function() {
      this.feed.removePhotoViews();
    },

    removePhotos: function() {
      var photos = this.feed.selected_photos();
      var text = 'Are you sure you want to remove the selected photos from this album?';
      if (!confirm(text)) return;
      _.invoke(photos, 'destroy');
      Backbone.trigger('notice', { message: 'Selected photos removed from album.' });
    }
  });
});
