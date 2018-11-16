addPostponedFunc [ 'allScriptsReady' ], ->
  console.log('all script loaded')
  loadSDK()
  return

FBInit = ->
  FB.init
    appId: '555372157897082'
    status : true
    cookie : true
    xfbml  : true
    version: 'v2.8'
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


#
#addPostponedFunc [ 'cssLoaded' ], ->
#  console.log('load fb sdk')
#  loadFacebookSDK()
#  bindFacebookEvents() unless window.fbEventsBound
#
#bindFacebookEvents = ->
#  $(document)
#    .on('page:fetch', saveFacebookRoot)
#    .on('page:change', restoreFacebookRoot)
#    .on('page:load', ->
#    FB?.XFBML.parse()
#  )
#  @fbEventsBound = true
#
#saveFacebookRoot = ->
#  if $('#fb-root').length
#    @fbRoot = $('#fb-root').detach()
#
#restoreFacebookRoot = ->
#  if @fbRoot?
#    if $('#fb-root').length
#      $('#fb-root').replaceWith @fbRoot
#    else
#      $('body').append @fbRoot
#
#loadFacebookSDK = ->
#  window.fbAsyncInit = initializeFacebookSDK
#  $.getScript("//connect.facebook.net/en_US/sdk.js")
#
#initializeFacebookSDK = ->
#  FB.init
#    appId  : '555372157897082'
#    status : true
#    cookie : true
#    xfbml  : true
#    version: 'v2.7'
