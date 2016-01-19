namespace('Fotio.Views.Photo', function(exports) {
  exports.AlbumFeed = Backbone.View.extend({
    el: '#album-feed',

    initialize: function() {
      this.render();
      $(window).on('resize', _.bind(this.render, this));
    },

    render: function() {
      // Resetting inline rules and setting opacity to 0 to avoid flicker from
      // albums covers shifting
      this.$el.css('opacity', 0);
      this.$el.css('margin-right', '');
      var albumCovers = this.$('.album-cover');
      albumCovers.css('height', '').css('width', '');
      var feedWidth = this.$el.width();
      var albumCover = this.$('.album-cover').first();
      var coverWidth = albumCover.outerWidth(true);
      var margin = coverWidth - albumCover.width();
      var perLine = Math.floor(feedWidth / coverWidth);
      var extraSpacing = perLine * margin;
      var newCoverWidth = Math.floor((feedWidth - extraSpacing) / perLine);
      albumCovers.width(newCoverWidth).height(newCoverWidth);
      this.$el.css('margin-right', -(margin + 1));
      this.$el.css('opacity', 1);
    }
  });
});
