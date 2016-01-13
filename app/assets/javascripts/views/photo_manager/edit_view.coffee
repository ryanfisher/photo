namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.EditView extends Backbone.View
    className: 'photo transparent'

    events:
      'click': 'toggle_selected'
      'click .edit': 'open_photo_editor'

    initialize: ->
      img_url = @model.thumbnail()
      if img_url then @setImage(img_url) else @$el.addClass('uploading')
      @listenTo @model, 'change:id', @finishUploading
      @$el.append($('<i>', class: 'fa fa-spinner fa-spin'))
      @$el.append($('<span>', class: 'percentage'))
      @listenTo @model, 'destroy', @remove
      @listenTo @model, 'percentUpdated', @updatePercentage
      @listenTo @model, '422', @unableToProcess

    selectedIndex: ->
      @$el.index() if @$el.hasClass('selected')

    updatePercentage: (args) ->
      @$('.percentage').text("#{args.percentage}%")

    unableToProcess: ->
      @$('i, .percentage').remove()
      @$el.removeClass('uploading transparent').addClass('error')
      @$el.append($('<i>', class: 'fa fa-warning', title: 'Duplicate photo found'));

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
      $('<img>', src: img_url).on 'load', => @$el.removeClass('transparent')
      thumbnail_url = "url(#{img_url})".replace /\s/, "%20"
      @$el.css('background-image', thumbnail_url)

    # Checks if photo is selected
    #
    # @return [Boolean]
    is_selected: ->
      @$el.is(':visible') and @$el.hasClass('selected')

    selectView: ->
      @$el.addClass('selected')

    toggle_selected: (event) ->
      @$el.toggleClass('selected')
      @trigger 'selected' if @$el.hasClass('selected') && event.shiftKey

    open_photo_editor: (event) ->
      event.stopPropagation()
