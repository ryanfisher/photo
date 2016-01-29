#= require collections/user/photos
#= require collections/album/photos

namespace 'Fotio.Views.Photo', (exports) ->
  class exports.Feed extends Backbone.View
    el: '#photo-feed'

    PHOTO_HEIGHT: 250

    initialize: ->
      type = if @$el.hasClass('album') then 'Album' else 'User'
      @collection = new Fotio.Collections[type].Photos(bootstrapped_photos)
      @render()
      @window_width = $(window).width()
      $(window).on 'resize', => @adjustPhotoSizes()

    adjustPhotoSizes: ->
      @render() unless @equalsPreviousWidth()

    equalsPreviousWidth: ->
      width = $(window).width()
      # We only need to reset the photo feed when window width changes
      return true if width == @window_width
      @window_width = width
      false

    render: ->
      # We set the scrollbar here so the width doesn't change when photos
      # overflow from view and scroll is automatically added
      $('html').css('overflow-y', 'scroll')
      @$el.text('')
      @collection.each (model) =>
        photo_view = new exports.View({model})
        photo_view.set_height(@PHOTO_HEIGHT)
        @$el.append(photo_view.$el)
