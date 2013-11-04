class Atendimento < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :place
  belongs_to  :type
  attr_accessible :data, :pessoa_id, :pessoa, :place_id, :type_id


  validates_presence_of :place 
  validates_presence_of :pessoa
  


end
