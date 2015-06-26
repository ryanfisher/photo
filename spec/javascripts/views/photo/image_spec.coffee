describe 'Fotio.Views.Photo.Image', ->
  beforeEach ->
    model = new Fotio.Models.User.Photo { file: {url: '/url'} }
    @subject = new Fotio.Views.Photo.Image { model }

  describe '#initialize', ->
    it 'creates an element with the hidden class', ->
      expect(@subject.$el.hasClass('hidden')).toBe(true)
