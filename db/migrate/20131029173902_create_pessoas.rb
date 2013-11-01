class CreatePessoas < ActiveRecord::Migration
  def change
    create_table :pessoas, :as_relation_superclass => true do |t|
      t.string :name
      t.string :identificacao
      t.timestamps
    end
  end
end
