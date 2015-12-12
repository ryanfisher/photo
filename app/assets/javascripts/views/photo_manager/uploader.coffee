namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.Uploader extends Backbone.View
    el: "#uploader"

    events:
      'change input': 'upload_photos'

    upload_photos: ->
      for photo_file in @$('.multiple-photos')[0].files
        @collection.upload(photo_file, complete: _.bind(@onComplete, this))

    onComplete: ->
      @$('form')[0].reset()
