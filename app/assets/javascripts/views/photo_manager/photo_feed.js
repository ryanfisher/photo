namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.PhotoFeed = Backbone.View.extend({
    removePhotoViews: function() {
      _.invoke(this.photoEditViews, 'remove')
      this.photoEditViews = []
    },

    render: function() {
      this.photoEditViews = [];
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
      var view = new exports.EditView({ model: model });
      this.listenTo(view, 'selected', _.bind(this.selectPhotos, this, view));
      this.photoEditViews.push(view);
    },

    // Handles shift select by selecting all photos in between just selected
    // photo and closest previously selected photo, looking to the left first
    // and then to the right
    //
    // @param [EditView] the currently selected photo edit view
    selectPhotos: function(view) {
      var photoIndexes = this.selectedPhotoIndexes();
      var selectedIndex = view.selectedIndex();
      var index = _.indexOf(photoIndexes, selectedIndex);
      if (photoIndexes.length < 2) return;
      var otherIndex = photoIndexes[index == 0 ? 1 : index - 1];
      var sliceIndexes = [otherIndex, selectedIndex];
      var toSelect = this.photoEditViews.slice(
        _.min(sliceIndexes),
        _.max(sliceIndexes)
      );
      _.invoke(toSelect, 'selectView');
    },

    selectedPhotoIndexes: function() {
      return _.compact(_.invoke(this.photoEditViews, 'selectedIndex'));
    },

    last_photo_view_el: function() {
      return this.photoEditViews[this.photoEditViews.length - 1].$el;
    },

    reset: function() {
      this.collection.each(_.bind(this.append_photo_view, this))
    },

    /* A list of photo models currently selected in the photo manager feed
     *
     * @return [Array<Photo>]
     */
    selected_photos: function() {
      var views = _.filter(this.photoEditViews, function(view) {
        return view.is_selected()
      });
      return _.pluck(views, 'model');
    }
  })
})
