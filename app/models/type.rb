class Type < ActiveRecord::Base
  belongs_to :place
  attr_accessible :name,  :place_id

  validates_presence_of :place
  validates_presence_of :name
  
end
