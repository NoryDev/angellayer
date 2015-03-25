// when the page is ready for manipulation
$(document).ready(function () {
  $('#submit-profile').click(function (e) {
    var profile_id = $( "#select-investor" ).val();
    console.log(profile_id)

    document.location.href='/investors/profile/' + profile_id;
    // prevent the default click action
    e.preventDefault();
  });
});