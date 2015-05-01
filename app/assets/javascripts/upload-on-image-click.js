
// when the page is ready for manipulation
$(document).ready(function () {
  $('#photo_path').hide
  // when the edit link is clicked
  // reloads document when button is clicked
  $("#false-button").click(function(){
    $("#profile_pic").click();
    // $('#profile_pic').change(function() {
    // $('#photo_path').val($(this).val());
    $('#photo_path').show
});
    return false;
});

});