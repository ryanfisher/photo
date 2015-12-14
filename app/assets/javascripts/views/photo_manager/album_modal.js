namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumModal = Backbone.View.extend({
    el: '#modal',

    events: {
      'click button.cancel': 'hide',
      'click button.create': 'create'
    },

    initialize: function() {
      this.render();
    },

    render: function() {
      this.$('.modal-body').html(
        '<form><input type="text" name="title" placeholder="Album title"><br>' +
        '<button class="cancel" type="button">Cancel</button>' +
        '<button class="create" type="button">Create album</button></form>'
      )
    },

    create: function() {
      if (this.creating) return;
      this.creating = true;
      this.collection.create({ title: this.$('[name=title]').val() });
      this.hide();
    },

    show: function() {
      this.$el.addClass('visible');
    },

    hide: function() {
      this.$el.removeClass('visible');
    }
  })
});
