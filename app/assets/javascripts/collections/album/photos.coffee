namespace 'Fotio.Collections.Album', (exports) ->
  class exports.Photos extends Backbone.Collection
    # Uses default ordering for albums
    url: '/api/photos'
    model: Fotio.Models.User.Photo

    positions: (album_id) ->
      this.map (photo) ->
        {
          album_id: album_id
          photo_id: photo.get('id'),
          position: photo.get('position')
        }
