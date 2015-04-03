class CreateEpisodes < ActiveRecord::Migration
  def change
    create_table :episodes do |t|
      t.integer :series_id
      t.text :content

      t.timestamps null: false
    end
  end
end
