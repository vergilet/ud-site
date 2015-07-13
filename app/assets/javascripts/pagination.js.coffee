#jQuery ->
#  loadMoreTitles();
#  if $('#infinite-scrolling').size() > 0
#    $(window).on 'scroll', ->
#      more_posts_url = $('.pagination a.next_page').attr('href')
#      if more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60
#        $('.pagination').html('load')
#        $.getScript more_posts_url
#      return
#    return

class @Pagination

  constructor: ()  ->
    more_posts_url = $('.pagination a.next_page').attr('href')
    $('#load_more_titles').on('click', $.getScript(more_posts_url))

$(document).ready ->
  if $('#infinite-scrolling').length
    new Pagination()