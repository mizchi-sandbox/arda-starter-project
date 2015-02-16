import subscriber = require('./subscriber');
import d = require('./defs')

class MainContext extends Arda.Context<d.Props, d.State, d.ComponentProps> {
  static component = require('../../components/main');
  static subscribers = [
    subscriber
  ];

  public initState(props){
    return {};
  }

  public expandComponentProps(props, state): d.ComponentProps{
    return {};
  }
}

export = MainContext;
