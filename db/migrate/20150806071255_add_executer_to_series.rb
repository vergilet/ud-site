class AddExecuterToSeries < ActiveRecord::Migration
  def change
    add_column :series, :executer, :string, default: 'UkrDub Спільнота'
  end
end
