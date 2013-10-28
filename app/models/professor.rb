class Professor < ActiveRecord::Base
  
  acts_as :pessoa
  attr_accessible :matricula

  validate_presence_of :matricula
end
