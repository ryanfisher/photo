#= require models/user/photo

class App extends Backbone.View
  initialize: ->
    if bootstrapped_photos? and $('#photo-feed').length
      if $('#photo-feed').hasClass('album')
        collection = new AlbumPhotos(bootstrapped_photos)
      else
        collection = new UserPhotos(bootstrapped_photos)
      new PhotoFeed({collection})
    if $('#photo-manager').length
      collection = new UserPhotos
      new PhotoManager({collection})
      collection.fetch()
      router = new ManagerRouter
      Backbone.history.start()
    if bootstrapped_photo?
      model = new Fotio.Models.User.Photo(bootstrapped_photo)
      new PhotoPage({model})
    if $('#login-background').length
      bg_path = '/static/images/grainy-beach.jpg'
      $('<img>', src: bg_path).load ->
        $('#login-background img').attr('src', bg_path).
          addClass('loaded')

$ -> new App
