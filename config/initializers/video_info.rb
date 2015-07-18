VideoInfo::PROVIDERS.push('Meta')
VideoInfo::PROVIDERS.push('FS')


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
    '//placehold.it/85x70/5050ff/ffffff&text=Vk.com'
  end

end