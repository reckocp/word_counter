class Word extends React.Component {
  constructor(props){
    super(props)
    this.state = {
      clicked: false
    }
  }

  _touchedMe(){
    // alert("ouch");
    var newState = {};
    newState["clicked"] = true;
    this.setState(newState);
  }
  render () {
    let open = <a onClick={this._touchedMe.bind(this)}>Show</a>;

    if(this.state.clicked){
      open =       <div>
              <h2> {this.props.word.sentence} </h2>
              <p> {this.props.sentenceCount} </p>
              <p> {this.props.wordCount} </p>
              <p> {this.props.charCount} </p>
              <p> {this.props.nounCount} </p>
              <p> {this.props.verbCount} </p>
              <p> {this.props.adjCount} </p>
              <p> {this.props.detCount} </p>
              <p> {this.props.punctCount} </p>
              <p> {this.props.mostCommonCharCount} </p>
            </div>
    }
    return (
      <div>
        {open}
      </div>
    )
  }
}
