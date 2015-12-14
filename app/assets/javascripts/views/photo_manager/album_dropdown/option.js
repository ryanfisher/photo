namespace('Fotio.Views.PhotoManager.AlbumDropdown', function(exports) {
  exports.Option = Backbone.View.extend({
    className: 'option album',

    initialize: function() {
      this.render();
    },

    render: function() {
      this.$el.text(this.model.get('title'));
    }
  })
});
