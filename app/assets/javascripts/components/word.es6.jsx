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
  _untouchedMe (){
    var oldState = {};
    oldState["clicked"] = true;
    this.setState(oldState);
  }
  render () {
    let open = <a onClick={this._touchedMe.bind(this)}>Show</a>;

    if(this.state.clicked){
      open =       <div>
              <h2> {this.props.word.sentence} </h2>
              <p> Number of sentences: {this.props.sentenceCount} </p>
              <p> Number of words: {this.props.wordCount} </p>
              <p> Number of characters: {this.props.charCount} </p>
              <p> Number of nouns: {this.props.nounCount} </p>
              <p> Number of verbs: {this.props.verbCount} </p>
              <p> Number of adjectives: {this.props.adjCount} </p>
              <p> Number of determiners: {this.props.detCount} </p>
              <p> Number of punctuation marks: {this.props.punctCount} </p>
              <p> Most common character used: {this.props.mostCommonCharCount} </p>
            </div>
    }
    return (
      <div>
        {open}
      </div>
    )
  }
}
