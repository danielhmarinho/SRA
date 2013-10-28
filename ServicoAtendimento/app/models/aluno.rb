class Aluno < ActiveRecord::Base

  acts_as :pessoa
  attr_accessible :matricula
end
