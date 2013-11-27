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
  var self = this
  $.ajax({
    url: '/sources/'+sourceId,
    type: 'put'
  }).done(function(sorted_sources_list) {
    self.updateSourcesList(sorted_sources_list)
    self.attachListenersToUpvoteButton()
  })
}

ApplicationController.prototype.updateSourcesList = function(sorted_sources_list) {
  $('ul li').remove()
  $('ul').append(sorted_sources_list)
}

$(document).ready(function() {
  applicationController = new ApplicationController
  applicationController.attachListenersToUpvoteButton()
})