# -*- encoding : utf-8 -*-
class Servidor < ActiveRecord::Base
  acts_as :user
  attr_accessible :matricula

  validates_uniqueness_of :matricula
  validates_numericality_of :matricula , greater_than: 0


end
