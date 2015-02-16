require './globals'
MainContext = require '../contexts/main'

module.exports = ->
  # Initialize global properties
  Promise.resolve require './globals'

  # Init router
  .then ->
    App.router = new Arda.Router Arda.DefaultLayout, document.body

  # Initialize databases
  .then -> App.router.pushContext MainContext, {}
