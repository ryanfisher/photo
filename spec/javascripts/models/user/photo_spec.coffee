describe 'Fotio.Models.User.Photo', (exports) ->
  beforeEach ->
    @subject = new Fotio.Models.User.Photo

  describe '#initialize', ->
    it 'should create the subject', ->
      expect(@subject).toBeDefined()

  describe '#width_from', ->
    beforeEach ->
      @subject.set 'height', 200
      @subject.set 'width', 100

    it 'returns the width from the current aspect ratio', ->
      expect(@subject.width_from(100)).toBe 50

  describe '#height_from', ->
    beforeEach ->
      @subject.set 'height', 200
      @subject.set 'width', 100

    it 'returns the height from the current aspect ratio', ->
      expect(@subject.height_from(50)).toBe 100

    it 'returns the set height when calling with set width', ->
      expect(@subject.height_from(100)).toBe 200
