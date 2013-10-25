class CreateAtendimentos < ActiveRecord::Migration
  def change
    create_table :atendimentos do |t|
      t.string :nome
      t.string :registro
      t.datetime :dataHora
      t.string :publicoAlvo
      t.references :TipoAtendimento
      t.references :LocalAtendimento

      t.timestamps
    end
    add_index :atendimentos, :TipoAtendimento_id
    add_index :atendimentos, :LocalAtendimento_id
  end
end
