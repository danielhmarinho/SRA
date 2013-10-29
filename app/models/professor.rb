class Professor < ActiveRecord::Base
  acts_as :pessoa
  attr_accessible :matricula

  validates_presence_of :matricula

end
