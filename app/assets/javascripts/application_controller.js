var ApplicationController = function() {
}

ApplicationController.prototype.attachListenersToUpvoteButton = function() {
  self = this
  $(".upvote-button").on('click', function() {
    var sourceId = Number(this.value)
    self.updateUpvoteCount(sourceId)
  })
  self.attachListenersToEditButton()
  self.attachListenersToDeleteButton()
}

ApplicationController.prototype.attachListenersToDeleteButton = function() {
  self = this
  $(".delete-button").on('click', function(e) {
    var sourceToDelete = Number(this.value)
    self.deleteSource(sourceToDelete)
  })
}

ApplicationController.prototype.attachListenersToEditButton = function() {
  self = this
  $(".edit-source-button").on('click', function() {
    var sourceToDelete = Number(this.value)
    self.editSource(sourceToDelete)
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

ApplicationController.prototype.editSource = function(sourceToEdit) {
  var self = this
  $.ajax({
    url: '/sources/'+sourceToEdit+'/edit',
    type: 'get'
  }).done(function(edited_source) {
    $('body').html(edited_source)
  })
}

ApplicationController.prototype.updateUpvoteCount = function(sourceId) {
  var self = this
  $.ajax({
    url: '/sources/'+sourceId+'/upvote',
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
  applicationController.attachListenersToEditButton()
})