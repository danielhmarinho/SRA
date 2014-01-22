# -*- encoding : utf-8 -*-
class Pessoa < ActiveRecord::Base

  acts_as_superclass
  attr_accessible :name

  validates_presence_of :name
  validates_format_of :name, with: /\A[a-zA-Z\s]+\z/


end
