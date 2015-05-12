#= require models/user/photo

class App extends Backbone.View
  initialize: ->
    if $(Fotio.Views.Photo.Feed::el).length
      new Fotio.Views.Photo.Feed
    if $(Fotio.Views.PhotoManager.Manager::el).length
      new Fotio.Views.PhotoManager.Manager
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
