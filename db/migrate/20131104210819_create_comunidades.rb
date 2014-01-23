# -*- encoding : utf-8 -*-
class CreateComunidades < ActiveRecord::Migration
  def change
    create_table :comunidades do |t|
      t.string :identificacao

      t.timestamps
    end
  end
end
