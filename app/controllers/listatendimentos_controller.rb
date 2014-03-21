class ListatendimentosController < ApplicationController
  def new
   Listatendimento.new("cert.pdf", generate_data).save
  end

  def create
   @atendimentos = Atendimento.all
   Listatendimento.new("cert.pdf").save
  end

  private

    def generate_data

      data = [ ["Nome", "Matricula", "Tipo do Usuario", "Tipo de Atendimento", "Data/Hora"] ]

      Atendimento.all.each do |atendimento|
        user = atendimento.user

        if user.has_role? :student
          role = "Aluno"
        elsif user.has_role? :professor
          role = "Professor"
        elsif user.has_role? :administrative
          role = "Servidor Administrativo"
        end

        type = atendimento.type.name
          data.push [user.name, user.matricula, role, type, l(atendimento.try(:data), :format => :long) ]
      end

      return data
    end

end

