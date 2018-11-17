addPostponedFunc [ 'allScriptsReady' ], ->
  $.getScript "//platform.twitter.com/widgets.js"
  $(document).on 'page:change', ->
    $.getScript "//platform.twitter.com/widgets.js"
