namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.AlbumModal = Backbone.View.extend({
    el: '#modal',

    events: {
      'click button.cancel': 'hide',
      'click button.create': 'create',
      'submit form': 'create'
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

    create: function(event) {
      event.preventDefault();
      if (this.creating) return;
      this.creating = true;
      title = this.$('[name=title]').val();
      this.collection.create({ title: title });
      this.hide();
      Backbone.trigger('notice', { message: 'New album (' + title + ') created.' });
    },

    show: function() {
      this.$el.addClass('visible');
      this.$('input').focus();
    },

    hide: function() {
      this.$el.removeClass('visible');
    }
  })
});
