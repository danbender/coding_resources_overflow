$(document).ready(function() {
  attachListenersToUpvoteButton()
})

function attachListenersToUpvoteButton() {
  $(".upvote-count").on('click', function(e) {
    var sourceId = Number(this.value)
  })
}