import d = require('./defs')

class SubContext extends Arda.Context<d.Props, d.State, d.ComponentProps> {
  get component() {
    return require('../../components/sub');
  }

  public initState(props){
    return {};
  }

  public expandComponentProps(props, state): d.ComponentProps{
    return {};
  }
}

export = SubContext;
