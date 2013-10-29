class Pessoa < ActiveRecord::Base

  acts_as_superclass
  attr_accessible :name
  validates_presence_of :name

  
end
