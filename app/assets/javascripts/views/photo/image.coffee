namespace 'Fotio.Views.Photo', (exports) ->
  class exports.Image extends Backbone.View
    tagName: 'img'
    className: 'transparent'

    initialize: ->
      @$el.on 'load', => @$el.removeClass('transparent')
      @$el.attr('src', @model.thumbnail())
