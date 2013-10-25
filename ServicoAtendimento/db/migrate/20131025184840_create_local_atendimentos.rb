class CreateLocalAtendimentos < ActiveRecord::Migration
  def change
    create_table :local_atendimentos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
