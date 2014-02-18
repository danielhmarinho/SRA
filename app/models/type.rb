# -*- encoding : utf-8 -*-
class Type < ActiveRecord::Base
  has_and_belongs_to_many :places
  attr_accessible :name,  :places, :place_ids
  
  validates_presence_of :name
  validates_uniqueness_of :name, :case_sensitive => false

  
end
