class EpisodePresenter

  attr_reader :episode

  def initialize episode
    @episode = episode
  end

  def self.instantiate episodes
    [] if episodes.blank?
    sorted_episodes = sort_my_episodes(episodes)
    sorted_episodes.map{ |episode| EpisodePresenter.new(episode) }.reverse
  end

  def id
    episode.try(:id)
  end

  def source_video
    return if episode.blank?
    video_info.embed_url
  end

  def name
    episode.try(:name)
  end

  def thumbnail
    video_info.try(:thumbnail_small).presence || '//placehold.it/85x70'
  end

  def episode_number
    return episode.episode_number if not_episode?
   "Епізод ##{episode.episode_number}"
  end

  def created_at
    episode.try(:created_at)
  end

  private

  def self.sort_my_episodes(episodes)
    real_eps = episodes.map {|ep| ep if ep.episode_number.to_i.to_s == ep.episode_number }.compact.sort_by{ |ep| ep.episode_number.to_i }
    other = episodes.map {|ep| ep if ep.episode_number.to_i.to_s != ep.episode_number }.compact.sort_by{ |ep| ep.episode_number.to_i }
    real_eps + other
  end
  
  def video_info
    @video_info ||= VideoInfo.new(episode.video_link)
  end

  def not_episode?
    episode.episode_number.to_i.zero?
  end

end