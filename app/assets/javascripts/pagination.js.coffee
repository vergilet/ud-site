loadMore:() ->
  more_posts_url = $('.pagination a.next_page').attr('href')
  if more_posts_url
    $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
    $.getScript more_posts_url