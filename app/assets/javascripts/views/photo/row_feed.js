namespace('Fotio.Views.Photo', function(exports) {
  exports.RowFeed = exports.Feed.extend({
    el: '#photo-feed',

    render: function() {
      // We set the scrollbar here so the width doesn't change when photos
      // overflow from view and scroll is automatically added
      $('html').css('overflow-y', 'scroll')
      this.$el.text('')
      var row = new exports.Row();
      // The extra one is to handle rounding issues when fitting into feed
      var feedWidth = parseInt(this.$el.width() - 1);
      this.collection.each(_.bind(function(model) {
        var view = new exports.View({ model: model });
        if (row.width() > feedWidth) {
          row.adjustWidth(feedWidth);
          row = new exports.Row();
        }
        row.append(view);
        this.$el.append(view.$el)
      }, this));
      if (row.width() > feedWidth) row.adjustWidth(feedWidth);
      this.$el.append(row.$el);
    },
  });
});
