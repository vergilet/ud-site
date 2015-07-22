addPostponedFunc [ 'allScriptsReady' ], 'vkWidget', ->
  loadTwitterSDK()
  $(document).on 'page:change', renderTimelines

loadTwitterSDK = ->
  $.getScript "//vk.com/js/api/openapi.js?116", ->
    renderTimelines()

renderTimelines = ->
  console.log('123')
  VK.init({apiId: 4878932, onlyWidgets: true});
  VK.Widgets.Comments("vk_comments", {autoPublish: 0, limit: 5, width: "auto", attach: "graffiti,photo,video,audio"}, "#{ request.original_url }");
  VK.Widgets.Group("vk_groups", {mode: 0, width: "auto", height: "445", color1: 'FFFFFF', color2: '2B587A', color3: '5B7FA6'}, 27070544);
