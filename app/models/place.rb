# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base
  has_many :atendimentos
  has_many :types
  attr_accessible :name
  validates_presence_of :name
end
