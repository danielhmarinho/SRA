#encoding: utf-8	
class TipoAtendimento < ActiveRecord::Base
  attr_accessible :tipo
  
  validates_presence_of :tipo, message: "O tipo de atendimento deve ser preenchido"
  validates_uniqueness_of :tipo, message: "Este tipo de atendimento já existe"

end
