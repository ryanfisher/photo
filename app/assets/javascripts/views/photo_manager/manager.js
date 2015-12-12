namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.Manager = Backbone.View.extend({
    el: '.dashboard.index',

    events: {
      'click .option.delete': 'deletePhotos'
    },

    initialize: function() {
      this.collection = new Fotio.Collections.User.SortablePhotos();
      this.feed =
        new Fotio.Views.PhotoManager.Feed({ collection: this.collection });
      this.collection.fetch();
    },

    deletePhotos: function() {
      var confirmText = 'Are you sure you want to delete the selected photos?';
      if (!confirm(confirmText)) return;
      _.invoke(this.feed.selected_photos(), 'destroy')
    }
  });
});
