namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.Feed extends exports.BaseView
    el: '#photo-manager-feed'

    events:
      'click .feed-container': 'clear_selections'
      'click .upload-button':  'openUploadInput'
      'click .option.delete': 'deletePhotos'

    initialize: ->
      @collection = new Fotio.Collections.User.SortablePhotos()
      this.uploader = new exports.Uploader({@collection})
      @collection.once 'sync', => @render()
      @collection.fetch()

    deletePhotos: ->
      confirmText = 'Are you sure you want to delete the selected photos?';
      return unless confirm(confirmText)
      _.invoke(this.selected_photos(), 'destroy')

    openUploadInput: ->
      @$('input.multiple-photos').click()

    reset: ->
      @cleanUp()
      @collection.each _.bind(@append_photo_view, this)

    removePhotoViews: ->
      _.invoke @photo_edit_views, 'remove'
      @photo_edit_views = []

    cleanUp: ->
      this.removePhotoViews()
      this.uploader.undelegateEvents();

    render: ->
      @photo_edit_views = []
      @collection.each _.bind(@append_photo_view, this)
      @collection.on 'add', (model) =>
        @new_photo_view model
        @$('.feed .upload-button').after @last_photo_view_el()

    append_photo_view: (model) ->
      @new_photo_view model
      @$('.feed').append @last_photo_view_el()

    new_photo_view: (model) ->
      photo_edit_view = new exports.EditView({model})
      @photo_edit_views.push photo_edit_view

    last_photo_view_el: ->
      @photo_edit_views[@photo_edit_views.length - 1].$el

    clear_selections: (event) ->
      target = $(event?.target)
      return if event? and not target.attr('class')?.match(/feed|feed-container/)
      @$('.feed .selected').removeClass('selected')

    # A list of photo models currently selected in the photo manager feed
    #
    # @return [Array<Photo>]
    selected_photos: ->
      views = _.filter @photo_edit_views, (view) -> view.is_selected()
      _.map views, (view) -> view.model
