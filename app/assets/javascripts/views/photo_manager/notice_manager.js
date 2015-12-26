namespace('Fotio.Views.PhotoManager', function(exports) {
  exports.NoticeManager = Backbone.View.extend({
    el: '#notice',

    defaultStatus: 'success',
    defaultDuration: 3000,

    initialize: function() {
      this.listenTo(Backbone, 'notice', this.displayNotice);
    },

    displayNotice: function(args) {
      this.$('p').text(args.message).addClass(args.status || this.defaultStatus);
      setTimeout(_.bind(this.removeNotice, this), args.duration || this.defaultDuration);
    },

    removeNotice: function() {
      this.$('p').text('').removeClass();
    }
  });
});
