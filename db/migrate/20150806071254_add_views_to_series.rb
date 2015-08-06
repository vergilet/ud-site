class AddViewsToSeries < ActiveRecord::Migration
  def change
    add_column :series, :views, :integer, default: 0
  end
end
