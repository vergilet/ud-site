class SeriesPresenter

  include SeriesHelper
  include ActionView::Helpers

  attr_reader :series, :episodes

  def initialize series
    @series = series
    @episodes = EpisodePresenter.sort_my_episodes(series.episodes)
  end

  def native
    series
  end

  def amount_of_days
    return 0 if last_episode.created_at.blank?
    distance_of_time_in_words_to_now(last_episode.created_at)
  end

  def self.instantiate few_series
    few_series.map { |series| SeriesPresenter.new(series) }.sort_by{ |series| last_update(series) }.reverse
  end

  def default_episode
    @default_episode ||= EpisodePresenter.new(episodes.last)
  end

  def default_meta_video
    default_episode.source_video if default_episode.present?
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
    links = series.tag_list.map {|tag| "<a href='#{ Rails.application.routes.url_helpers.genre_path(tag)}' class='label label-success'>#{tag}</a>" }
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
    # series.preloaded_cover || series.cover
    series.cover
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

  def tile_last_ep_name
    "\"#{last_episode_name}\"" if last_episode_name.present?
  end

  def tile_episode_counter
    return 'Анімаційний фільм' if anime_film?
    return 'Фільм' if film?
    "Епізод ##{episodes_count}"
  end

  def category
    series.category
  end

  private

  def film?
    series.category_id == '3'
  end

  def anime_film?
    series.category_id == '8'
  end

  def episode_time
    series.episode_time
  end

  def self.last_update(series)
    series.try(:updated_at)
  end

end
