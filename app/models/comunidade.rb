class Comunidade < ActiveRecord::Base
  
  acts_as :pessoa
  attr_accessible :identificacao
  validates_uniqueness_of :identificacao

end
