class AddAncestryToMicropost < ActiveRecord::Migration
	
	def self.up
		add_column :microposts, :ancestry, :string
		add_index :microposts, :ancestry
	end

	def self.down
		remove_index :microposts, :ancestry
		remove_column :messages, :ancestry
	end	
end
