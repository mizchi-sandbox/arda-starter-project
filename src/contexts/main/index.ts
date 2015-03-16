import subscriber = require('./subscriber');
import d = require('./defs')

class MainContext extends Arda.Context<d.Props, d.State, d.ComponentProps> {
  get component(){ return require('../../components/main'); }
  get subscribers(){ return [subscriber]; }

  public initState(props){
    return {};
  }

  public expandComponentProps(props, state): d.ComponentProps{
    return {};
  }
}

export = MainContext;
