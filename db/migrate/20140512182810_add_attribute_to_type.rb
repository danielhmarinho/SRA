class AddAttributeToType < ActiveRecord::Migration
  def change
    add_column :types, :active, :boolean, default: true
  end
end
