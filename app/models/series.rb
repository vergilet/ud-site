class Series < ActiveRecord::Base
  has_many :episodes, dependent: :destroy
  belongs_to :category
  acts_as_taggable
  accepts_nested_attributes_for :episodes, allow_destroy: true,  reject_if: lambda { |a| a.blank? }

  # has_attached_file :cover,
  #                   styles: { :original => ["373x525>", 'jpeg'] },
  #                   storage: :dropbox,
  #                   dropbox_credentials: Rails.root.join('config/dropbox.yml'),
  #                   dropbox_options: {path: proc { |style| "files/series/#{id}/cover.jpeg" } }

  mount_uploader :cover, CoverUploader

  validates_presence_of(:name, :description, :cover, :category_id)

  # :original_name, :episodes_amount, :episode_time
  # :year, :studio_name, :video_info, :audio_info,
  # :translator, :actors, :sound_maker,
  # :source_mirror, :source_mirror_additional
  # :torrent

  # after_save :preload_image if :changed_cover?

  def self.all_ordered_by_child
    includes(:episodes).order('episodes.created_at DESC, series.created_at DESC')
  end

  def cover_name
    "&#8600; #{cover_file_name}".html_safe if cover.present?
  end

  def self.search(query)
    joins(:episodes).where("lower(episodes.name) like lower(?) OR lower(series.name) like lower(?) OR lower(series.original_name) like lower(?)", "%#{query.downcase}%", "%#{query.downcase}%", "%#{query.downcase}%").uniq
  end

  def self.genre(query)
    tagged_with(query.downcase)
  end

  def increment(by = 1)
    self.views ||= 0
    self.views += by
    self.save
  end
  
  private

  def changed_cover?
    self.cover_changed?
  end

end
