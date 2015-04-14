class Series < ActiveRecord::Base
  has_many :episodes, dependent: :destroy
  acts_as_taggable
  accepts_nested_attributes_for :episodes, allow_destroy: true,  reject_if: lambda { |a| a.blank? }
  has_attached_file :cover,
                    styles: { :original => ["373x525>", 'jpeg'] },
                    storage: :dropbox,
                    dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                    dropbox_options: {path: proc { |style| "files/series/#{id}/cover.jpeg" } }

  has_attached_file :torrent,
                    storage: :dropbox,
                    dropbox_credentials: Rails.root.join('config/dropbox.yml'),
                    dropbox_options: {path: proc { |style| "files/series/#{id}/torrent.torrent" } }

  validates_attachment_content_type :cover, :content_type => /\Aimage\/.*\Z/
  validates_attachment_content_type :torrent, :content_type => 'application/x-bittorrent'

  validates_presence_of(:name, :description, :cover)

  # :original_name, :episodes_amount, :episode_time
  # :year, :studio_name, :video_info, :audio_info,
  # :translator, :actors, :sound_maker,
  # :source_mirror, :source_mirror_additional
  # :torrent


end
