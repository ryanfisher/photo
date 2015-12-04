namespace 'Fotio.Collections.User', (exports) ->
  class exports.Photos extends Backbone.Collection
    url: '/api/photos'
    model: Fotio.Models.User.Photo

    upload: (photo_file, progress_info, callbacks)->
      info = progress_info
      form_data = new FormData()
      form_data.append('file', photo_file)
      $.ajax
        type: "POST"
        url: "/api/photos"
        data: form_data
        success: (data) =>
          @add data
          info.display_message(200)
        error: (jqXHR) -> info.display_message(jqXHR.status)
        complete: =>
          info.stop_animation()
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
                info.update_bar(percentUploaded)
            myXhr.upload.addEventListener 'progress', callback, false
          myXhr
