class SeriesPresenter

  include SeriesHelper

  attr_reader :series, :episodes

  def initialize series
    @series = series
    @episodes = series.episodes
  end

  def default_episode
    @default_episode ||= EpisodePresenter.new(episodes.first)
  end

  def default_meta_video
    default_episode.meta_video
  end

  def name
    series.name
  end

  def original_name
    series.original_name
  end

  def description
    series.description
  end

  def categories
    links = series.tag_list.map {|tag| "<a href='#' class='label label-success'>#{tag}</a>" }
    links.sort.join(' ').html_safe
  end

  def episodes_amount_and_time
    "#{episodes_count} з #{episodes_amount || '?' } - (~#{episode_time || '??:??'})"
  end

  def year
    series.year
  end

  def studio_name
    series.studio_name
  end

  def video_info
    series.video_info
  end

  def audio_info
    series.audio_info
  end

  def translator
    series.translator
  end

  def actors
    series.actors
    #links = series.actors.map {|actor| "<a href='#' class=''>#{actor}</a>" }
    #links.sort.join(', ').html_safe
  end

  def sound_maker
    series.sound_maker
    #links = series.sound_maker.map {|sm| "<a href='#' class=''>#{sm}</a>" }
    #links.sort.join(', ').html_safe
  end

  def cover
    series.cover
  end

  def torrent
    series.torrent
  end

  def source_mirror
    series.source_mirror
  end

  def source_mirror_additional
    series.source_mirror_additional
  end

  private

  def episodes_amount
    series.episodes_amount
  end

  def episode_time
    series.episode_time
  end

  def episodes_count
    episodes.count
  end

end