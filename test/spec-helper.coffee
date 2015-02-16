# Setup DOM Env
jsdom = require('jsdom').jsdom
global.document  = jsdom('<html><body></body></html>')
global.window    = document.parentWindow
global.navigator = window.navigator
React = require 'react/addons'
global.TestUtils = React.addons.TestUtils

# Libraries
require '../lib/setup/globals'

# stubs
global.localStorage = require('localStorage')

# Assert
global.assert = require 'power-assert'
cheerio = require 'cheerio'
sinon = require 'sinon'

# test helper
global.$ = (html) -> cheerio.load html

beforeEach -> @sinon = sinon.sandbox.create()
afterEach  -> @sinon.restore()
