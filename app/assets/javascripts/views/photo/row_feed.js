namespace('Fotio.Views.Photo', function(exports) {
  exports.RowFeed = exports.Feed.extend({
    el: '#photo-feed',

    render: function() {
      this.$el.text('')
      var row = new exports.Row();
      this.collection.each(_.bind(function(model) {
        var view = new exports.View({ model: model });
        var feedWidth = this.$el.width();
        if (row.width() > feedWidth) {
          row.adjustWidth(feedWidth);
          this.$el.append(row.$el)
          row = new exports.Row();
        }
        row.append(view);
      }, this));
      this.$el.append(row.$el);
    },
  });
});
