
VideoInfo::Providers::Youtube.class_eval do

  def thumbnail_small
    "//img.youtube.com/vi/#{ video_id }/mqdefault.jpg"
  end

end    
