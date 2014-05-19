class RemoveAncestryFromMicropost < ActiveRecord::Migration
  def change
    remove_column :microposts, :ancestry, :integer
  end
end
