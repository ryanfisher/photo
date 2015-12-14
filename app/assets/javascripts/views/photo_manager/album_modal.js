namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumModal = Backbone.View.extend({
    el: '#modal',

    events: {
      'click button': 'hide'
    },

    initialize: function() {
      this.render();
    },

    render: function() {
      this.$('.modal-body').html(
        '<form><input type="text" name="title"><br>' +
        '<button type="button">Create album</button></form>'
      )
    },

    show: function() {
      this.$el.addClass('visible');
    },

    hide: function() {
      this.$el.removeClass('visible');
    }
  })
});
