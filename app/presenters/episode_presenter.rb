class EpisodePresenter

  attr_reader :episode

  def initialize episode
    @episode = episode
  end

  def self.instantiate episodes
    sorted_episodes = sort_my_episodes(episodes)
    sorted_episodes.map{ |episode| EpisodePresenter.new(episode) }
  end

  def id
    episode.id
  end

  def meta_video
    video_info.embed_url
  end

  def name
    episode.name
  end

  def episode_number
    return episode.episode_number if not_episode?
   "Епізод ##{episode.episode_number}"
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