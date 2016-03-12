class RemoveDefault < ActiveRecord::Migration
  def change
    change_column :series, :executer, :string, :default => nil
  end
end
