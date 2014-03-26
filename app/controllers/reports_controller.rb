# -*- encoding : utf-8 -*-
require "prawn"
require 'prawn/layout'

class ReportsController < ApplicationController
  load_and_authorize_resource
 

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(params[:report])

    if @report.save
      generate_data

      path = Rails.root.join("app", "assets", "relatorio.pdf")
      send_file path, :filename => "RelatorioAtendimentos.pdf", :type => "application/pdf"
    else
      flash[:error] = "O relatório não pode ser gerado!"  
      redirect_to new_report_path
    end

    
  end

  private

    def generate_data

      atendimentos_data = [ format_titles( ["Nome", "Matrícula", "Tipo do Usuário", "Tipo de Atendimento", "Data/Hora"] ) ]

      Atendimento.all.each do |atendimento|
        user = atendimento.user
        role = verify_user user 
        type = atendimento.type.name
        
        atendimentos_data += [[user.name, user.matricula, role, type, l(atendimento.try(:data), :format => :long) ]]
      end

      path = Rails.root.join("app", "assets", "relatorio.pdf")

      pdf(atendimentos_data).render_file(path)
    end


    def format_titles(content)
      content.map do |cell|
        cell = "<font size='14'><b>#{cell}</b></font>"
      end
    end


    def pdf(atendimentos_data)
      
      pdf_options = {
        :page_size => "A4",
        :page_layout => :landscape,
        :margin => [20, 20]
      }
      
      Prawn::Document.new(pdf_options) do |pdf|
          
          pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 65], :width => pdf.bounds.width, :height => 460 do
            columns = { 0 => 190, 1 => 75, 2 => 100, 3 => 250, 4 => 185}
            pdf.table(atendimentos_data, :header => true, :cell_style => { :inline_format => true, :align => :center } ,:column_widths => columns )
          end

          pdf.page_count.times do |i|
            pdf.go_to_page(i+1)
            pdf.draw_text "#{i+1} / #{pdf.page_count}", :at=>[1,1]
          end

          pdf.repeat :all do

            #Header Title
            pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width do
              pdf.image "#{Rails.root}/app/assets/images/UNB4.jpg", :vposition => 10
              pdf.move_up(4)
              
              pdf.move_down(15)
              pdf.stroke_horizontal_rule
            end

            #Footer
            pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width => pdf.bounds.width do
              pdf.stroke_horizontal_rule
              pdf.move_down(5)
              pdf.text "Brasília, #{Time.now.strftime("%d/%m/%Y")}", :align => :center
            end
          end
      end

    end
end