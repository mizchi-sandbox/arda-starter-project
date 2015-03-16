# Setup DOM Env
jsdom = require('jsdom').jsdom
global.document  = jsdom('<html><body></body></html>')
global.window    = document.defaultView
global.navigator = window.navigator
React = require 'react/addons'
global.TestUtils = React.addons.TestUtils

# Libraries
require '../lib/setup/globals'

# Assert
global.assert = require 'power-assert'
sinon = require 'sinon'

# test helper
beforeEach -> @sinon = sinon.sandbox.create()
afterEach  -> @sinon.restore()
