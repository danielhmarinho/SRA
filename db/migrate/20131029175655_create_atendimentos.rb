# -*- encoding : utf-8 -*-
class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.references :user
      t.references :place
      t.references :type

      t.timestamps
    end
    add_index :atendimentos, :user_id
    add_index :atendimentos, :place_id
    add_index :atendimentos, :type_id
  end
end
