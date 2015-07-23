addPostponedFunc [ 'allScriptsReady' ], ->
  loadTwitterSDK()
  $(document).on 'page:change', renderTimelines

loadTwitterSDK = ->
  $.getScript "//vk.com/js/api/openapi.js?116", ->
    setTimeout (->
      renderTimelines()
    ), 2000

renderTimelines = ->
  VK.init({apiId: 4878932, onlyWidgets: true});
  if $('#vk_comments').length
    console.log(location.href)
    VK.Widgets.Comments("vk_comments", {autoPublish: 0, limit: 5, width: "auto", attach: "graffiti,photo,video,audio"}, "#{ location.href }");
  if $('#vk_groups').length
    VK.Widgets.Group("vk_groups", {mode: 0, width: "auto", height: "445", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 27070544);
