# -*- encoding : utf-8 -*-
class CreateProfessors < ActiveRecord::Migration
  def change
    create_table :professors do |t|
      t.string :matricula
      t.timestamps
    end
  end
end
