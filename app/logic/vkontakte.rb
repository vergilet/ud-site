include ActionView::Helpers::AssetUrlHelper

VideoInfo::Providers::Vkontakte.class_eval do

  def thumbnail_small
    _video_thumbnail(0)
  end

  def thumbnail_medium
    _video_thumbnail(1)
  end

  def thumbnail_large
    _video_thumbnail(2)
  end

  private

  def _video_thumbnail(id)
    '//pp.vk.me/c622130/v622130144/3c622/Oz-z1bfMEFI.jpg'
  end

end