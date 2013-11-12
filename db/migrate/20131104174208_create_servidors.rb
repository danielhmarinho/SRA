# -*- encoding : utf-8 -*-
class CreateServidors < ActiveRecord::Migration
  def change
    create_table :servidors do |t|
      t.string :matricula
      t.timestamps
    end
  end
end
