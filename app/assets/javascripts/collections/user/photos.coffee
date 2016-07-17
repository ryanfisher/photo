namespace 'Fotio.Collections.User', (exports) ->
  class exports.Photos extends Backbone.PageableCollection
    url: '/api/photos'
    model: Fotio.Models.User.Photo

    upload: (photo_file, callbacks)->
      form_data = new FormData()
      form_data.append('file', photo_file)
      newPhoto = @add({})
      $.ajax
        type: "POST"
        url: "/api/photos"
        data: form_data
        success: _.bind(newPhoto.set, newPhoto),
        error: (jqXHR) -> newPhoto.trigger(jqXHR.status)
        complete: => callbacks.complete()
        processData: false,
        contentType: false,
        xhr: =>
          myXhr = $.ajaxSettings.xhr();
          if myXhr.upload
            callback = (ev) ->
              if ev.lengthComputable
                percentUploaded = Math.floor(ev.loaded * 100 / ev.total)
                newPhoto.trigger('percentUpdated', { percentage: percentUploaded })
              console.log(percentUploaded)
            myXhr.upload.addEventListener 'progress', callback, false
          myXhr
