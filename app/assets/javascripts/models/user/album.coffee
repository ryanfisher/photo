namespace 'Fotio.Models.User', (exports) ->
  class exports.Album extends Backbone.Model

    parse: (response, options) ->
      photos = new AlbumPhotos(response['photos'])
      response['photos'] = photos
      super(response, options)
