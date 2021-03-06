module Html {
  /*
  Returns an empty Html node. It is useful for example if you don't want to
  render something conditionally.

    if (Array.isEmpty(items)) {
      Html.empty()
    } else {
      <div>
        <{ items }>
      </div>
    }
  */
  fun empty : Html {
    `false`
  }

  fun isNotEmpty (element : Html) {
    `!!#{element}`
  }
}
