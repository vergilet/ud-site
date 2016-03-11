class AddExecuterToSeries < ActiveRecord::Migration
  def change
    add_column :series, :executer, :string, default: 'UkrDub Community'
  end
end
