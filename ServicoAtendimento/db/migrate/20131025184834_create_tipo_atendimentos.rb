class CreateTipoAtendimentos < ActiveRecord::Migration
  def change
    create_table :tipo_atendimentos do |t|
      t.string :nome

      t.timestamps
    end
  end
end
