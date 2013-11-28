# -*- encoding : utf-8 -*-
class Type < ActiveRecord::Base
  belongs_to :place
  attr_accessible :name,  :place_id

  validates_presence_of :place
  validates_presence_of :name
  validates_format_of :name, with: /\A[0-9a-zA-Z\s]+\z/

  
end
