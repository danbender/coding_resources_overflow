var ApplicationController = function() {
}

ApplicationController.prototype.attachListenersToUpvoteButton = function() {
  self = this
  $(".upvote-count").on('click', function(e) {
    var sourceId = Number(this.value)
    self.updateUpvoteCount(sourceId)
  })
}

ApplicationController.prototype.updateUpvoteCount = function(sourceId) {
  $.ajax({
    url: '/sources/'+sourceId,
    type: 'put'
  }).done(function(sourceIdAndCount) {
    $('#source-'+sourceIdAndCount.source_id).text(sourceIdAndCount.current_count)
  })
}
$(document).ready(function() {
  applicationController = new ApplicationController
  applicationController.attachListenersToUpvoteButton()
})