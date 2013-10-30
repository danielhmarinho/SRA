class Type < ActiveRecord::Base
  belongs_to :place
  attr_accessible :name,  :place_id

  validates_presence_of :place
  
end
