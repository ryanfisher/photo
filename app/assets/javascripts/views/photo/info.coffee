namespace 'Fotio.Views.Photo', (exports) ->
  class exports.Info extends Backbone.View
    className: 'info'

    initialize: ->
      link = $('<a>'
               href: "/profile/#{@model.get('username')}"
               text: @model.get('username')
               )
      @$el.append($('<span>', text: "photographer: ").append(link))
