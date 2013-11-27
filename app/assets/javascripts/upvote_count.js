var ApplicationController = function() {
}

ApplicationController.prototype.attachListenersToUpvoteButton = function() {
  self = this
  $(".upvote-button").on('click', function() {
    var sourceId = Number(this.value)
    self.updateUpvoteCount(sourceId)
  })
}

ApplicationController.prototype.attachListenersToDeleteButton = function() {
  self = this
  $(".delete-button").on('click', function() {
    var sourceToDelete = Number(this.value)
    self.deleteSource(sourceToDelete)
  })
}

ApplicationController.prototype.deleteSource = function(sourceToDelete) {
  var self = this
  $.ajax({
    url: '/sources/'+sourceToDelete,
    type: 'delete'
  }).done(function(deleted_source) {
    $('#source-'+sourceToDelete).remove()
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
  $('#list-of-sources ul').remove()
  $('#list-of-sources').append(sorted_sources_list)
}

$(document).ready(function() {
  applicationController = new ApplicationController
  applicationController.attachListenersToUpvoteButton()
  applicationController.attachListenersToDeleteButton()
})