
// when the page is ready for manipulation
$(document).ready(function () {
  // when the edit link is clicked
  $('.edit-comment-form').hide()
  $('.comment-show a').click(function (e) {
      // prevent the default click action
      e.preventDefault();
      // show the edit form
      $(e.target).parents(".comment-show").find( ".edit-comment-form").slideDown();
  });

  // when the Cancel link is clicked
  $( '.edit-comment-form a' ).click(function(e) {
  e.preventDefault();
  // hide the edit form
  $(e.target).parents(".edit-comment-form").slideUp();
  });

});