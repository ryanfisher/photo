namespace 'Fotio.Models.User', (exports) ->
  class exports.Photo extends Backbone.Model
    height_from: (width) ->
      Math.round(width * @get('height') / @get('width'))

    width_from: (height) ->
      Math.round(height * @get('width') / @get('height'))

    thumbnail: ->
      @get('thumb_url')

    optimized: ->
      @get('url')
