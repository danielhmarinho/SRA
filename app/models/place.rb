# -*- encoding : utf-8 -*-
class Place < ActiveRecord::Base
  has_many :atendimentos
  has_many :types
  attr_accessible :name
  validates_presence_of :name
  validates_format_of :name, with: /\A[0-9a-zA-Z\s]+\z/

end
