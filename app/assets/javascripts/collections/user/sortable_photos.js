//= require ./photos

namespace('Fotio.Collections.User', function(exports) {
  exports.SortablePhotos = exports.Photos.extend({
    sortTypes: {
      'upload-date': 'created_at',
      'date-taken': 'taken'
    },

    initialize: function() {
      this.sortKey = 'created_at';
      this.order = 'desc'
    },

    sortBy: function(type) {
      this.sortKey = this.sortTypes[type] || this.sortKey;
      this.sort()
    },

    comparator: function(model1, model2) {
      this.value1 = model1.get(this.sortKey)
      this.value2 = model2.get(this.sortKey)
      if (this.value1 > this.value2 && this.order === 'asc' ||
          this.value1 < this.value2 && this.order === 'desc')
        return 1;
      else return -1;
    }
  });
});
