class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.references :pessoa
      t.datetime :data
      t.references :place

      t.timestamps
    end
    add_index :atendimentos, :pessoa_id
    add_index :atendimentos, :place_id
  end
end
