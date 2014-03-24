class ReportsController < ApplicationController
  # GET /reports
  # GET /reports.json
  def index

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end

    format.pdf { render :layout => false } 
  end

  def new
    @report = Report.new("relatorio.pdf", generate_data).save

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end

  end


  # POST /reports
  # POST /reports.json
  def create

  end

  private

    def generate_data

      data = [ format_titles( ["Nome", "Matricula", "Tipo do Usuario", "Tipo de Atendimento", "Data/Hora"] ) ]

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
        5.times do
          data += [[user.name, user.matricula, role, type, l(atendimento.try(:data), :format => :long) ]]
        end
      end

      return data
    end

    def format_titles(content)
      content.map do |cell|
        cell = "<font size='14'><b>#{cell}</b></font>"
      end
    end
end