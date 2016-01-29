#= require models/user/photo

class SimpleApp extends Backbone.View
  initialize: ->
    views = [
      Fotio.Views.Photo.RowFeed,
      Fotio.Views.Photo.AlbumFeed
    ]
    _.each views, (view) -> new view if $(view::el).length
    if bootstrapped_photo?
      model = new Fotio.Models.User.Photo(bootstrapped_photo)
      new Fotio.Views.Photo.Page({model})
    if $('#login-background').length
      bg_path = '/static/images/grainy-beach.jpg'
      $('<img>', src: bg_path).load ->
        $('#login-background img').attr('src', bg_path).
          addClass('loaded')

$ ->
  $(document).ajaxSend (e, xhr, options) ->
    token = $("meta[name='csrf-token']").attr("content")
    xhr.setRequestHeader("X-CSRF-Token", token)
  new SimpleApp
