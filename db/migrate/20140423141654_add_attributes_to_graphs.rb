class AddAttributesToGraphs < ActiveRecord::Migration
  def change
  	add_column :graphs, :start_date, :string
    add_column :graphs, :end_date, :string
    
  
  end
end
