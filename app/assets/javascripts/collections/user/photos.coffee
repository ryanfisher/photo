namespace 'Fotio.Collections.User', (exports) ->
  class exports.Photos extends Backbone.Collection
    url: '/api/photos'
    model: Fotio.Models.User.Photo
