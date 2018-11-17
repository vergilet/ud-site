addPostponedFunc [ 'allScriptsReady' ], ->
  loadTwitterSDK()
  $(document).on 'page:change', renderTimelines

loadTwitterSDK = ->
  $.getScript "//platform.twitter.com/widgets.js", ->
