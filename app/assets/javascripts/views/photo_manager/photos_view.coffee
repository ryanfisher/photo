namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.PhotosView extends exports.BaseView
    el: '#photo-manager-feed'

    events:
      'click .feed-container': 'clear_selections'
      'click .upload-button':  'openUploadInput'
      'click .option.delete': 'deletePhotos'

    initialize: ->
      @collection = new Fotio.Collections.User.SortablePhotos()
      @uploader = new exports.Uploader({ @collection })
      @feed = new exports.PhotoFeed({ el: @$('.feed'), @collection })
      @albumDropdown = new exports.AlbumDropdown();
      @albumDropdown.feed = this;
      @collection.once 'sync', => @feed.render()
      @collection.fetch()

    deletePhotos: ->
      confirmText = 'Are you sure you want to delete the selected photos?';
      return unless confirm(confirmText)
      _.invoke(@feed.selected_photos(), 'destroy')

    openUploadInput: ->
      @$('input.multiple-photos').click()

    reset: ->
      @cleanUp()
      @feed.reset()

    cleanUp: ->
      @feed.removePhotoViews()
      @uploader.undelegateEvents();
      @albumDropdown.undelegateEvents();

    clear_selections: (event) ->
      target = $(event?.target)
      return if event? and not target.attr('class')?.match(/feed|feed-container/)
      @$('.feed .selected').removeClass('selected')
