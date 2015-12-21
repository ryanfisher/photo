namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.EditView extends Backbone.View
    className: 'photo hidden'

    events:
      'click': 'toggle_selected'
      'click .edit': 'open_photo_editor'

    initialize: ->
      img_url = @model.thumbnail()
      if img_url then @setImage(img_url) else @$el.addClass('uploading')
      @listenTo @model, 'change:id', @finishUploading
      @$el.append($('<i>', class: 'fa fa-spinner fa-spin'))
      @listenTo @model, 'destroy', @remove

    finishUploading: ->
      @$el.removeClass('uploading')
      img_url = @model.thumbnail()
      return @setImage(img_url) if img_url
      @$el.addClass('processing')
      @listenTo @model, 'change:thumb_url', -> @setImage(@model.thumbnail())
      @checkImgUrl = setInterval(_.bind(@model.fetch, @model), 3000)

    updatePosition: ->
      this.model.set('position', this.$el.index());

    setImage: (img_url) ->
      return unless img_url
      clearInterval(@checkImgUrl)
      @$el.removeClass('processing')
      # Load image before showing it in view
      $('<img>', src: img_url).on 'load', => @$el.removeClass('hidden')
      thumbnail_url = "url(#{img_url})".replace /\s/, "%20"
      @$el.css('background-image', thumbnail_url)

    # Checks if photo is selected
    #
    # @return [Boolean]
    is_selected: ->
      @$el.is(':visible') and @$el.hasClass('selected')

    toggle_selected: (event) ->
      # Don't fire click event on photo manager feed
      event.stopPropagation()
      @$el.toggleClass('selected')
      @trigger 'selected_toggle'

    open_photo_editor: (event) ->
      event.stopPropagation()
