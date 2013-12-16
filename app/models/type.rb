# -*- encoding : utf-8 -*-
class Type < ActiveRecord::Base
  has_and_belongs_to_many :places
  attr_accessible :name, :place_id
  
  validates_presence_of :name
  validates_format_of :name, with: /\A[0-9a-zA-Z\s]+\z/

  
end
