require '../spec-helper'
describe "components/main", ->
  Main = require '../../lib/components/main'
  it "should be rendered", ->
    component = TestUtils.renderIntoDocument React.createFactory(Main) {}
    assert component.getDOMNode().innerHTML isnt ''
