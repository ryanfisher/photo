describe 'Fotio.Collections.User.Albums', ->
  beforeEach ->
    @server = sinon.fakeServer.create()
    @server.respondWith [200, { 'Content-Type': 'application/json'}, '[{ "photos": [{}, {}] }]']
    @subject = new Fotio.Collections.User.Albums

  afterEach ->
    @server.restore()

  describe '#initialize', ->
    it 'should set up an album', ->
      expect(@subject).toBeDefined()

  describe '#fetch', ->
    beforeEach ->
      @subject.fetch()
      @server.respond()
      @model = @subject.models[0]

    it 'should have made a server request', ->
      expect(@server.requests.length).toBe 1

    it 'should set a model', ->
      expect(@model).toBeDefined()

    it 'should parse the photos into a collection', ->
      expect(@model.get('photos').models.length).toBe 2
