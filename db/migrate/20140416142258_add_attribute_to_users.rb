class AddAttributeToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :external_user, :boolean, default: false
  end
end
