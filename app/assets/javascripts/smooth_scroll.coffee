$(document).ready ($) ->
  $('.scroll-to-top').click (event) ->
    event.preventDefault()
    $('html,body').animate { scrollTop: 0 }, 'slow'
    return false
$(document).on 'turbolinks:load', ->
  $('.scroll-to-top').click (event) ->
    event.preventDefault()
    $('html,body').animate { scrollTop: 0 }, 'slow'
    return false
