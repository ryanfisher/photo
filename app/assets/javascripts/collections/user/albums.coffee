namespace 'Fotio.Collections.User', (exports) ->
  class exports.Albums extends Backbone.Collection
    url: '/api/albums'
    model: Fotio.Models.User.Album
