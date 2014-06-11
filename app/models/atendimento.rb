# -*- encoding : utf-8 -*-
class Atendimento < ActiveRecord::Base
  belongs_to :user
  belongs_to :place
  belongs_to  :type
  attr_accessible :user_id, :user, :place_id, :type_id , :place , :type , :type_name, :created_at

  delegate :name, to: :type , prefix: true
  validates_presence_of :place
  validates_presence_of :type

end
