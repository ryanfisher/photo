#= require models/user/photo

class App extends Backbone.View
  initialize: ->
    $(document).ajaxSend (e, xhr, options) ->
      token = $("meta[name='csrf-token']").attr("content")
      xhr.setRequestHeader("X-CSRF-Token", token)
    if $(Fotio.Views.Photo.Feed::el).length
      new Fotio.Views.Photo.RowFeed
    if $(Fotio.Views.PhotoManager.Feed::el).length
      new Fotio.Views.PhotoManager.Feed
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
