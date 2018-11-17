addPostponedFunc [ 'allScriptsReady' ], ->
  $.getScript "//platform.twitter.com/widgets.js"
  $(document).on 'turbolinks:load', ->
    $.getScript "//platform.twitter.com/widgets.js"
