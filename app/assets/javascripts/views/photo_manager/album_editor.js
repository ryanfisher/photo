//= require ./base_view

namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumEditor = exports.BaseView.extend({
    el: '#album-editor',

    events: {
      'click .option.delete': 'deleteAlbum',
      'click .option.change-title': 'changeTitle'
    },

    initialize: function() {
      this.listenTo(this.model, 'sync', this.render);
      this.model.fetch();
    },

    render: function() {
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

    savePositions: function() {
      _.invoke(this.feed.photoEditViews, 'updatePosition');
      var positions = this.collection.positions(this.model.id);
      $.post('/api/sorted_photos/update_positions', {
        positions: positions, success: this.updateNotice
      });
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
    }
  });
});
