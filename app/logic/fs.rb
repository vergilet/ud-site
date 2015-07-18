class FS < VideoInfo::Provider
  def self.usable?(url)
    url =~ /(fs.to\/video\/films\/iframeplayer)/
  end

  def provider
    'FS'
  end

  def duration
    _video_media_group['yt$duration']['seconds'].to_i
  end

  def embed_url
    @url
  end

  def thumbnail_small
    _video_thumbnail
  end

  private

  def _url_regex
    /iframeplayer\/(.*)/
  end

  def _video_thumbnail
    "https://pp.vk.me/c629116/v629116144/9123/xs8EpgOz87c.jpg"
  end
end
