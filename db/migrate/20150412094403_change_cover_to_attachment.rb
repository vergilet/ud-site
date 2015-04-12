class ChangeCoverToAttachment < ActiveRecord::Migration
  def change
    remove_column :series, :cover

    add_attachment :series, :cover
  end
end
