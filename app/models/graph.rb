class Graph < ActiveRecord::Base

  attr_accessible :date, :place

  validates_presence_of :date
  validates_presence_of :place

end
