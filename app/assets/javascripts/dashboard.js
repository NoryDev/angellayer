// when the page is ready for manipulation
$(document).ready(function () {
  $('#submit-profile').click(function (e) {
    var profile_id = $( "#select-investor" ).val();
    console.log(profile_id)
    if(profile_id == 0) {
      document.location.href='/investors/profile/';
    }
    else {
      document.location.href='/investors/profile/' + profile_id + '/evaluations/new';
    // prevent the default click action
    }
    e.preventDefault();
  });
});