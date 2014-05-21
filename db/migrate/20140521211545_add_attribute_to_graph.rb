class AddAttributeToGraph < ActiveRecord::Migration
  def change
  	add_column :graphs, :place_id, :string
  	#add_index :graphs, :place_id
  end
end
