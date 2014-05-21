# -*- encoding : utf-8 -*-
class Atendimento < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  belongs_to  :type
  attr_accessible :data, :user_id, :user, :place_id, :type_id , :place , :type , :type_name

  validates_presence_of :place
  validates_presence_of :type
  validates_presence_of :data
  


end
