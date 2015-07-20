class AddCoverToSeries < ActiveRecord::Migration
  def change
    add_column :series, :cover, :string
  end
end
