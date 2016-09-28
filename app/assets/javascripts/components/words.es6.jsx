class Words extends React.Component {
  constructor(props) {
    super(props);
  }

  render () {
    return (
      <div>
      <h2> Welcome to Word Counter </h2>
      {this.props.words.map(function(x){
        return (
          <p key={x.id}> <a href={"/words/" + x.id }> {x.sentence} </a> </p>
        )
      })}
      </div>
    )
  }
}
