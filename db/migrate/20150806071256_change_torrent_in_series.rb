class ChangeTorrentInSeries < ActiveRecord::Migration
  def change
    rename_column :series, :torrent_file_name, :torrent
    remove_column :series, :torrent_content_type
    remove_column :series, :torrent_file_size
    remove_column :series, :torrent_updated_at
  end
end
