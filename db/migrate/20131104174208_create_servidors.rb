class CreateServidors < ActiveRecord::Migration
  def change
    create_table :servidors do |t|

      t.timestamps
    end
  end
end
