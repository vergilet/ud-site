class AddFieldForSeries < ActiveRecord::Migration
  def change
    add_column :series, :original_name, :string
    add_column :series, :cover, :string
    add_column :series, :description, :text
    add_column :series, :episodes_amount, :string
    add_column :series, :episode_time, :string
    add_column :series, :year, :string
    add_column :series, :studio_name, :string
    add_column :series, :video_info, :string
    add_column :series, :audio_info, :string
    add_column :series, :translator, :string
    add_column :series, :actors, :string
    add_column :series, :sound_maker, :string
    add_column :series, :torrent, :string
    add_column :series, :source_mirror, :string
    add_column :series, :source_mirror_additional, :string

  end
end
