namespace 'Fotio.Models.User', (exports) ->
  class exports.Album extends Backbone.Model
    urlRoot: '/api/albums'

    parse: (response, options) ->
      photos = new Fotio.Collections.Album.Photos(response['photos'])
      response['photos'] = photos
      super(response, options)

    addPhoto: (model) ->
      photos = @get('photos') or []
      photos.push model
      @set('photos', photos)
