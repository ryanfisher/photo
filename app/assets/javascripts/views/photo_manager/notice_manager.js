namespace('Fotio.Views.PhotoManager', function(exports) {
  // To display a notice, trigger a notice event on the Backbone object,
  // passing in an argument object with a message property where the value is
  // the notice message to display
  //
  // @example
  //   Backbone.trigger('notice', { message: 'Selected photos deleted.' });
  exports.NoticeManager = Backbone.View.extend({
    el: '#notice',

    defaultStatus: 'success',
    defaultDuration: 3000,

    initialize: function() {
      this.listenTo(Backbone, 'notice', this.displayNotice);
    },

    displayNotice: function(args) {
      this.removeNotice();
      this.$('p').text(args.message).addClass(args.status || this.defaultStatus);
      var duration = args.duration || this.defaultDuration;
      clearTimeout(this.timeout);
      this.timeout = setTimeout(_.bind(this.removeNotice, this), duration);
    },

    removeNotice: function() {
      this.$('p').text('').removeClass();
    }
  });
});
