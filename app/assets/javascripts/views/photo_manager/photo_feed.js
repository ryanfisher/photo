namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.PhotoFeed = Backbone.View.extend({
    removePhotoViews: function() {
      _.invoke(this.photo_edit_views, 'remove')
      this.photo_edit_views = []
    },

    render: function() {
      this.photo_edit_views = [];
      this.collection.each(_.bind(this.append_photo_view, this))
      this.collection.on('add', _.bind(function(model) {
        this.new_photo_view(model);
        this.$('.upload-button').after(this.last_photo_view_el());
      }, this));
    },

    append_photo_view: function(model) {
      this.new_photo_view(model)
      this.$el.append(this.last_photo_view_el());
    },

    new_photo_view: function(model) {
      var view = new exports.EditView({ model: model })
      this.photo_edit_views.push(view)
    },

    last_photo_view_el: function() {
      return this.photo_edit_views[this.photo_edit_views.length - 1].$el;
    },

    reset: function() {
      this.collection.each(_.bind(this.append_photo_view, this))
    },

    /* A list of photo models currently selected in the photo manager feed
     *
     * @return [Array<Photo>]
     */
    selected_photos: function() {
      var views = _.filter(this.photo_edit_views, function(view) {
        return view.is_selected()
      });
      return _.pluck(views, 'model');
    }
  })
})
