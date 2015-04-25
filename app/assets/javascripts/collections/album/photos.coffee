namespace 'Fotio.Collections.Album', (exports) ->
  class exports.Photos extends Backbone.Collection
    # Uses default ordering for albums
    url: '/api/photos'
    model: Fotio.Models.User.Photo
