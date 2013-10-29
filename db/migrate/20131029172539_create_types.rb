class CreateTypes < ActiveRecord::Migration
  def change
    create_table :types do |t|
      t.string :name
      t.references :place

      t.timestamps
    end
    add_index :types, :place_id
  end
end
