describe 'Fotio.Models.User.Album', ->
  beforeEach ->
    @subject = new Fotio.Models.User.Album { url: '' }

  describe '#initialize', ->
    it 'should set up an album', ->
      expect(@subject).toBeDefined()
