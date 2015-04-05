// append the users partial to our div with class of container
$('.founder-container').append('<%= escape_javascript(render(:partial => "founder")) %>');

<% if @founders.empty? %>
  $('.load-more').remove();
<% end %>