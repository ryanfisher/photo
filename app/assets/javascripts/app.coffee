#= require models/user/photo

class App extends Backbone.View
  initialize: ->
    if bootstrapped_photos? and $('#photo-feed').length
      if $('#photo-feed').hasClass('album')
        collection = new Fotio.Collections.Album.Photos(bootstrapped_photos)
      else
        collection = new Fotio.Collections.User.Photos(bootstrapped_photos)
      new Fotio.Views.Photo.Feed({collection})
    if $('#photo-manager').length
      collection = new Fotio.Collections.User.Photos
      new Fotio.Views.PhotoManager.Manager({collection})
      collection.fetch()
      router = new Fotio.Routers.Manager
      Backbone.history.start()
    if bootstrapped_photo?
      model = new Fotio.Models.User.Photo(bootstrapped_photo)
      new Fotio.Views.Photo.Page({model})
    if $('#login-background').length
      bg_path = '/static/images/grainy-beach.jpg'
      $('<img>', src: bg_path).load ->
        $('#login-background img').attr('src', bg_path).
          addClass('loaded')

$ -> new App
