namespace 'Fotio.Views.Photo', (exports) ->
  class exports.Page extends Backbone.View
    el: '.photo-container'

    initialize: ->
      image = $('<img>', src: @model.optimized(), class: 'hidden')
      image.on 'load', => image.removeClass('hidden')
      @$el.prepend(image)
