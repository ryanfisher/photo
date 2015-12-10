namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.Uploader extends Backbone.View
    el: "#uploader"

    events:
      'click h4': 'toggle_open'
      'change input': 'upload_photos'
      'click .close': 'close'

    initialize: ->
      $('#id_file').hide()
      @uploading = false

    toggle_open: ->
      @$('form').toggleClass('hidden')

    upload_photos: ->
      return if @collection.uploading
      @collection.uploading = true
      for photo_file in @$('.multiple-photos')[0].files
        @collection.upload(
          photo_file,
          new exports.ProgressInfo(photo_file),
          complete: _.bind(@onComplete, this)
        )

    onComplete: ->
      @$('form')[0].reset()
