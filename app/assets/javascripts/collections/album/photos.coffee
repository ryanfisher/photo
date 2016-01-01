#= require models/user/album_photo

namespace 'Fotio.Collections.Album', (exports) ->
  class exports.Photos extends Backbone.Collection
    # Uses default ordering for albums
    url: '/api/photos'
    model: Fotio.Models.User.AlbumPhoto

    positions: (album_id) ->
      this.map (photo) ->
        {
          id: photo.get('id'),
          position: photo.get('position')
        }
