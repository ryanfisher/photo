#= require ./feed

namespace 'Fotio.Views.Photo', (exports) ->
  class exports.ColumnFeed extends exports.Feed
    el: '#photo-feed'

    PHOTO_WIDTH_MIN: 300

    render: ->
      # We set the scrollbar here so the width doesn't change when photos
      # overflow from view and scroll is automatically added
      $('html').css('overflow-y', 'scroll')
      @set_up_columns()
      @collection.each (model) =>
        photo_view = new exports.View({model})
        photo_view.set_width(@columns[0].get_width())
        column = _.min @columns, (col) -> col.height
        column.append(photo_view)

    set_up_columns: ->
      @$el.text('')
      column_count = Math.floor(@$el.width() / @PHOTO_WIDTH_MIN)
      width = @$el.width() / column_count
      @columns = (new exports.Column for i in [1..column_count])
      @$el.append(col.set_width(width).$el) for col in @columns
