class AddPreloadedCoverToSeries < ActiveRecord::Migration
  def change
    add_column :series, :preloaded_cover, :string
  end
end
