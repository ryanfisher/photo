describe 'Fotio.Views.Photo.Image', ->
  beforeEach ->
    model = new Fotio.Models.User.Photo { file: {url: '/url'} }
    @subject = new Fotio.Views.Photo.Image { model }

  describe '#initialize', ->
    it 'creates an element with the transparent class', ->
      expect(@subject.$el.hasClass('transparent')).toBe(true)
