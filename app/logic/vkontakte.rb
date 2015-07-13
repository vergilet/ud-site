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
    image_path 'vk-video.jpg'
  end

end