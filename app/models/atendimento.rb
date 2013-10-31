class Atendimento < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :place
  attr_accessible :data, :pessoa_id, :place_id

  validates_presence_of :place 
  validates_presence_of :pessoa
  
end
