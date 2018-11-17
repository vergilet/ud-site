addPostponedFunc [ 'allScriptsReady' ], ->
  loadTwitterSDK()
  $(document).on 'page:change'
    loadTwitterSDK()

loadTwitterSDK = ->
  $.getScript "//platform.twitter.com/widgets.js", ->
