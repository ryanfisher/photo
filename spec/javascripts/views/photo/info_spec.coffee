describe 'Fotio.Views.Photo.Info', ->
  beforeEach ->
    model = new Backbone.Model(username: 'jonsnow')
    @subject = new Fotio.Views.Photo.Info { model }

  describe '#initialize', ->
    it 'sets up a link to the photographer profile', ->
      expect(@subject.$('a').attr('href')).toBe '/profile/jonsnow'
