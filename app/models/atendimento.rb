class Atendimento < ActiveRecord::Base
  belongs_to :pessoa
  belongs_to :place
  attr_accessible :data, :pessoa_id, :place_id
end
