template = require './template'
module.exports = React.createClass
  mixins: [Arda.mixin, require('./actions')]
  render: ->
    template @
