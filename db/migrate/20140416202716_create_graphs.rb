class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :start_date
      t.string :end_date
      t.string :place

      t.timestamps
    end
  end
end
