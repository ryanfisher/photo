namespace('Fotio.Views.PhotoManager.AlbumDropdown', function(exports) {
  exports.Option = Backbone.View.extend({
    className: 'option album',

    events: {
      'click': 'addSelectedPhotos'
    },

    initialize: function() {
      this.render();
    },

    render: function() {
      this.$el.text(this.model.get('title'));
    },

    addSelectedPhotos: function() {
      _.each(this.feed.selected_photos(), this.model.addPhoto, this.model)
      this.model.save()
    }
  })
});