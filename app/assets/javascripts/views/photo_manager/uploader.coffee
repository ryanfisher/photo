namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.Uploader extends Backbone.View
    el: "#uploader"

    events:
      'change input': 'upload_photos'

    initialize: ->
      $('#id_file').hide()
      @uploading = false

    upload_photos: ->
      return if @collection.uploading
      @collection.uploading = true
      for photo_file in @$('.multiple-photos')[0].files
        @collection.upload(photo_file, complete: _.bind(@onComplete, this))

    onComplete: ->
      @$('form')[0].reset()
