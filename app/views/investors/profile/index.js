$('.investor-container').append('<%= escape_javascript(render(:partial => "investor")) %>');
//hide the edit forms

<% if @profiles.empty? %>
  $('.load-more').remove();
<% end %>