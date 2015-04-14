class EpisodePresenter

  attr_reader :episode

  def initialize episode
    @episode = episode
  end

  def self.instantiate episodes
    episodes.map{ |episode| EpisodePresenter.new(episode) }
  end

  def id
    episode.id
  end

  def meta_video
    "//video.meta.ua/iframe/#{meta_uri}/"
  end

  def name
    episode.name
  end

  def episode_number
    return episode.episode_number if not_episode?
   "Епізод ##{episode.episode_number}"
  end

  private

  def meta_uri
    link = episode.video_link
    uri = URI.parse(link)
    uri.path[1..-7]
  end

  def not_episode?
    episode.episode_number.to_i.zero?
  end

end