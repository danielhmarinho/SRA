class Comunidade < ActiveRecord::Base
  
  acts_as :pessoa
  attr_accessible :identificacao
  validates_presence_of :identificacao
end
