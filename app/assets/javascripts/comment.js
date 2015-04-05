
// when the page is ready for manipulation
$(document).ready(function () {
  // when the edit link is clicked
  // reloads document when button is clicked
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

$(document).ready(function () {
  // when the new comment is clicked
  // reloads document when button is clicked
  $(document).on("click", '.new-comment a', function (e) {
      // prevent the default click action
      e.preventDefault();
      // show the new-comment form
      $(e.target).parents(".new-comment").find( ".new-comment-form").slideDown();

  });

  // when the Cancel link is clicked
  $(document).on("click", '.new-comment-form a', function (e) {
  e.preventDefault();
  // hide the new-comment form
  $('.new-comment-form').slideUp();
  });

});