class AddColumnsToSeries < ActiveRecord::Migration
  def change
    add_column :series, :category_id, :string
  end
end
