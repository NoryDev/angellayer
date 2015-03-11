
// when the page is ready for manipulation
$(document).ready(function () {
  // when the edit link is clicked
  // cette fonction permet de reloader le document pour que les boutons edit fonctionnent
  $(document).on("click", '.comment-show a', function (e) {
      // prevent the default click action
      e.preventDefault();
      // show the edit form
      $(e.target).parents(".comment-show").find( ".edit-comment-form").slideDown();
  });

  // when the Cancel link is clicked
  $(document).on("click", '.edit-comment-form a', function (e) {
  e.preventDefault();
  // hide the edit form
  $('.edit-comment-form').slideUp();
  });

});