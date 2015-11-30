describe('Fotio.Views.Photo.Row', function() {
  var subject;

  beforeEach(function() {
    subject = new Fotio.Views.Photo.Row()
  });

  describe('#width', function() {
    describe('when there is only one photo', function() {
      beforeEach(function() {
        var model = new Fotio.Models.User.Photo({ width: 200, height: 350 });
        var view = new Fotio.Views.Photo.View({ model: model });
        subject.append(view);
      });

      it('should sum up the widths of all views adding 15 to each', function() {
        expect(subject.width()).toBe(200);
      });
    });

    describe('when there are two photo views', function() {
      beforeEach(function() {
        var model = new Fotio.Models.User.Photo({ width: 200, height: 350 });
        var view = new Fotio.Views.Photo.View({ model: model });
        subject.append(view);
        var view2 = new Fotio.Views.Photo.View({ model: model });
        subject.append(view2);
      });

      it('should sum up the widths of all views adding 15 for margins', function() {
        expect(subject.width()).toBe(415);
      });
    });
  });
});
