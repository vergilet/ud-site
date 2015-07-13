class @Paginate

  @loadMore: ->
    more_posts_url = $('.hidden-element.paginate a.next_page').attr('href')
    if more_posts_url
      $('.hidden-elemen.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />')
      $.getScript more_posts_url


