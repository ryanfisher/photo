namespace('Fotio.Models.User', function(exports) {
  exports.AlbumPhoto = exports.Photo.extend({
    urlRoot: '/api/sorted_photos'
  })
});
