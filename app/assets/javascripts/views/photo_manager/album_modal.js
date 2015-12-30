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
      var title = this.model ? this.model.get('title') : '';
      this.$('.modal-body').html(
        '<form><input type="text" name="title" placeholder="Album title" value="' + 
        title + '"><br>' +
        '<button class="cancel" type="button">Cancel</button>' +
        '<button class="create" type="button">Create album</button></form>'
      )
    },

    create: function(event) {
      event.preventDefault();
      if (this.creating) return;
      this.creating = true;
      title = this.$('[name=title]').val();
      var notice;
      if (this.model) {
        this.model.save({ title: title });
        notice = 'Album title updated.';
      } else {
        this.collection.create({ title: title });
        notice = 'New album (' + title + ') created.';
      }
      this.hide();
      Backbone.trigger('notice', { message: notice });
    },

    show: function() {
      this.$el.addClass('visible');
      this.$('input').focus();
    },

    hide: function() {
      this.$el.removeClass('visible');
      this.undelegateEvents();
    }
  })
});
