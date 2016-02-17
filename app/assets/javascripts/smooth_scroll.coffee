$(document).ready ($) ->
  $('.scroll-to-top').click (event) ->
    event.preventDefault()
    $('html,body').animate { scrollTop: $(@hash).offset().top }, 0
