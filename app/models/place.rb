# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base
  has_many :atendimentos
  has_and_belongs_to_many :types
  
  attr_accessible :name, :type_ids, :types
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false

end
