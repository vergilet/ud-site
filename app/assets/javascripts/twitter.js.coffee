addPostponedFunc [ 'allScriptsReady' ], ->
  $(document).on 'turbolinks:load', ->
    $.getScript "//platform.twitter.com/widgets.js"
