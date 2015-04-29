class SeriesPresenter

  include SeriesHelper

  attr_reader :series, :episodes

  def initialize series
    @series = series
    @episodes = EpisodePresenter.sort_my_episodes(series.episodes)
  end

  def native
    series
  end

  def self.instantiate few_series
    few_series.map { |series| SeriesPresenter.new(series) }.sort_by{ |series| last_update(series) }.reverse
  end

  def default_episode
    @default_episode ||= EpisodePresenter.new(episodes.first)
  end

  def default_meta_video
    default_episode.source_video
  end

  def last_episode
    @last_episode ||= EpisodePresenter.new(episodes.last)
  end

  def last_episode_name
    last_episode.name
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
    series.preloaded_cover || series.cover
  end

  def torrent
    series.torrent.presence
  end

  def torrent_url
    series.torrent.url
  end

  def source_mirror
    series.source_mirror.presence
  end

  def source_mirror_additional
    series.source_mirror_additional.presence
  end

  def episodes_amount
    series.episodes_amount
  end

  def episodes_count
    episodes.count
  end

  private

  def episode_time
    series.episode_time
  end

  def self.last_update(series)
    series.try(:last_episode).try(:created_at) || series.created_at
  end

end