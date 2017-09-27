# addPostponedFunc [ 'allScriptsReady' ], ->
#   loadTwitterSDK()
#   $(document).on 'page:change', renderTimelines

FBInit = ->
  FB.init
    appId: ''
    xfbml: true
    version: 'v2.8'
  return

$(document).ready ->
  $.getScript '//connect.facebook.net/pt_BR/sdk.js#xfbml=1&version=v2.8', FBInit
  return
$(document).on 'turbolinks:load', (event) ->
  if typeof FB != 'undefined' and FB != null
    FB.XFBML.parse()
  return
$(document).on 'turbolinks:before-cache', ->
  $('[data-turbolinks-no-cache]').remove()
  return
  
loadTwitterSDK = ->
  $.getScript "//vk.com/js/api/openapi.js?116", ->
    setTimeout (->
      renderTimelines()
    ), 2000

# renderTimelines = ->
#   VK.init({apiId: 4878932, onlyWidgets: true});
#   if $('#vk_comments').length
#     $('#vk_comments').empty()
#     VK.Widgets.Comments("vk_comments", {autoPublish: 0, limit: 5, width: "auto", attach: "graffiti,photo,video,audio"}, "#{ location.href }");
#   if $('#vk_groups').length
#     $('#vk_groups').empty()
#     VK.Widgets.Group("vk_groups", {mode: 0, width: "auto", height: "445", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 27070544);
#   if $('#vk_all_comments').length
#     $('#vk_all_comments').empty()
#     VK.Widgets.CommentsBrowse('vk_all_comments', {width: "auto", limit: 10, mini: 1});
