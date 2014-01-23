# -*- encoding : utf-8 -*-
class Comunidade < ActiveRecord::Base
  
  acts_as :user
  attr_accessible :identificacao
  validates_uniqueness_of :identificacao

  usar_como_cpf :identificacao
end
