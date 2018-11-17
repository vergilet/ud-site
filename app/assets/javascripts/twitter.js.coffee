addPostponedFunc [ 'allScriptsReady' ], ->
  loadTwitterSDK()
  $(document).on 'page:change'

loadTwitterSDK = ->
  $.getScript "//platform.twitter.com/widgets.js", ->
