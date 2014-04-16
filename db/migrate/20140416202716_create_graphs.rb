class CreateGraphs < ActiveRecord::Migration
  def change
    create_table :graphs do |t|
      t.string :date
      t.string :place

      t.timestamps
    end
  end
end
