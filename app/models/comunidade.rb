# -*- encoding : utf-8 -*-
class Comunidade < ActiveRecord::Base
  
  acts_as :pessoa
  attr_accessible :identificacao
  validates_uniqueness_of :identificacao
  validates_numericality_of :identificacao , greater_than: 0


end
