class CreatePlacesTypesTable < ActiveRecord::Migration

def self.up
 create_table :places_types, :id => false do |t|
   t.references :place
   t.references :type
 end
 add_index :places_types, [:place_id, :type_id]
  end
end
