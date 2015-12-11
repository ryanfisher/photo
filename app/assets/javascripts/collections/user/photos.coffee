namespace 'Fotio.Collections.User', (exports) ->
  class exports.Photos extends Backbone.Collection
    url: '/api/photos'
    model: Fotio.Models.User.Photo

    upload: (photo_file, callbacks)->
      form_data = new FormData()
      form_data.append('file', photo_file)
      $.ajax
        type: "POST"
        url: "/api/photos"
        data: form_data
        success: (data) =>
          @add data
        error: (jqXHR) -> console.log(jqXHR.status)
        complete: =>
          @uploading = false
          callbacks.complete()
        processData: false,
        contentType: false,
        xhr: ->
          myXhr = $.ajaxSettings.xhr();
          if myXhr.upload
            callback = (ev) ->
              if ev.lengthComputable
                percentUploaded = Math.floor(ev.loaded * 100 / ev.total)
            myXhr.upload.addEventListener 'progress', callback, false
          myXhr
