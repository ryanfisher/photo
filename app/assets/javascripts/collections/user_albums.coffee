class UserAlbums extends Backbone.Collection
  url: '/api/albums'
  model: Fotio.Models.User.Album
