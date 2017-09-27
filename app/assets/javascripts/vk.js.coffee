addPostponedFunc [ 'allScriptsReady' ], ->
  loadSDK()
  $(document).on 'page:change', FBInit

FBInit = ->
  FB.init
    appId: '555372157897082'
    xfbml: true
    version: 'v2.10'
  return


$(document).on 'turbolinks:load', (event) ->
  if typeof FB != 'undefined' and FB != null
    FB.XFBML.parse()
  return
$(document).on 'turbolinks:before-cache', ->
  $('[data-turbolinks-no-cache]').remove()
  return
  
loadSDK = ->
  $.getScript '//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.8', FBInit
  return
