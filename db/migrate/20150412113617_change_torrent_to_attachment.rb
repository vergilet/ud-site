class ChangeTorrentToAttachment < ActiveRecord::Migration

    def change
      remove_column :series, :torrent
      add_attachment :series, :torrent
    end

end
