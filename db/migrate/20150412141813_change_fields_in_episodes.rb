class ChangeFieldsInEpisodes < ActiveRecord::Migration
  def change
    remove_column :episodes, :content

    add_column :series, :season, :integer

    add_column :episodes, :episode_number, :string
    add_column :episodes, :name, :string
    add_column :episodes, :video_link, :string

  end
end
