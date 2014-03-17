class ListatendimentosController < ApplicationController
  def new
  	Listatendimento.new("cert.pdf", Atendimento.all).save
  end

  def create
  	#@atendimentos = Atendimento.all
  	#Listatendimento.new("cert.pdf").save
  end
end
