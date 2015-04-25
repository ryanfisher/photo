namespace 'Fotio.Models.User', (exports) ->
  class exports.Photo extends Backbone.Model
    height_from: (width) ->
      width * @get('height') / @get('width')

    width_from: (height) ->
      height * @get('width') / @get('height')
