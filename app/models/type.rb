class Type < ActiveRecord::Base
  belongs_to :place
  attr_accessible :name,  :place_id
  
end
