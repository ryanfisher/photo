namespace 'Fotio.Views.PhotoManager', (exports) ->
  class exports.AlbumsEditor extends Backbone.View
    el: '#albums-editor'

    events:
      'submit form': 'save_album'
      'click #new-album': 'open_new_album_form'

    initialize: ->
      @collection.fetch success: => @render()

    render: ->
      @collection.each _.bind(@add_album, this)
      @collection.on 'add', _.bind(@add_album, this)

    add_album: (album) ->
      title = $('<a>', text: album.get('title'))
      title.on 'click', => @edit_album(album)
      album.on 'destroy', => title.remove()
      @$('.albums').prepend(title)

    edit_album: (model) ->
      @album_editor = new exports.AlbumEditor({model})

    open_new_album_form: ->
      @$('form').toggleClass('hidden')

    save_album: ->
      event.preventDefault()
      input = @$('input[name=title]')
      @$('form').addClass('hidden')
      @collection.create title: input.val()
      input.val('')

    close: ->
      @album_editor?.close()
      @$el.removeClass('open')
