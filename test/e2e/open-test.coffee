Nightmare = require 'nightmare'
path = require 'path'

describe 'open', ->
  it 'can open', (done, reject) ->
    url = path.resolve __dirname + '/../../public/index.html'
    new Nightmare()
      .goto url
      .wait()
      .evaluate (-> document.body.innerHTML), (html) ->
        assert html.indexOf('Now Loading') isnt -1
      .screenshot path.resolve __dirname + '/screenshots/open.png'
      .run (err, nightmare) ->
        if err then return done(err)
        done()
