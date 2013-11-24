var ApplicationController = function() {
}

ApplicationController.prototype.attachListenersToUpvoteButton = function() {
  $(".upvote-count").on('click', function(e) {
    var sourceId = Number(this.value)
  })
}

$(document).ready(function() {
  applicationController = new ApplicationController
  applicationController.attachListenersToUpvoteButton()
})