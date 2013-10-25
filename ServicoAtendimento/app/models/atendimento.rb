class Atendimento < ActiveRecord::Base
  belongs_to :TipoAtendimento
  belongs_to :LocalAtendimento
  attr_accessible :dataHora, :nome, :publicoAlvo, :registro, :TipoAtendimento, :LocalAtendimento
end
