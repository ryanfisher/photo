//= require ./photos

namespace('Fotio.Collections.User', function(exports) {
  exports.SortablePhotos = exports.Photos.extend({
    sortTypes: {
      'upload-date': 'id',
      'date-taken': 'taken'
    },

    initialize: function() {
      this.sortKey = 'id';
    },

    sortBy: function(type) {
      this.sortKey = this.sortTypes[type] || this.sortKey;
      this.sort()
    },

    comparator: function(model1, model2) {
      this.value1 = model1.get(this.sortKey)
      this.value2 = model2.get(this.sortKey)
      return this.value1 > this.value2 ? 1 : -1;
    }
  });
});
