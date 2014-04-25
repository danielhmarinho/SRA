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

    if @report.valid?
      generate_data

      path = Rails.root.join("app", "assets", "relatorio.pdf")
      send_file path, :filename => "RelatorioAtendimentos.pdf", :type => "application/pdf"
    else
      @report.errors.each do |key, error|
        flash[:error] = "O relatório não pode ser gerado: #{error}"
      end

      redirect_to new_report_path
    end

    
  end

  private

     def generate_data

      place = nil

      atendimentos_data = [ format_titles( ["Nome", "Matrícula", "Data/Hora", "Público-alvo", "Tipo de Atendimento"] ) ]

      atendimentos = filter_atendimentos params[:report]

      atendimentos.each do |atendimento|
        user = atendimento.user
        role = verify_user user 
        type = atendimento.type.name
        
        atendimentos_data += [[user.name, user.matricula, l(atendimento.try(:data), :format => :long), role, type ]]
      end


      path = Rails.root.join("app", "assets", "relatorio.pdf")

      pdf(atendimentos_data, place).render_file(path)
    end


    def format_titles(content)
      content.map do |cell|
        cell = "<font size='14'><b>#{cell}</b></font>"
      end
    end
    

    def pdf(atendimentos_data, place)
      
      pdf_options = {
        :page_size => "A4",
        :page_layout => :landscape,
        :margin => [20, 20]
      }
      
      Prawn::Document.new(pdf_options) do |pdf|
          
          pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 90], :width => pdf.bounds.width, :height => 440 do
            columns = { 0 => 190, 1 => 75, 2 => 185, 3 => 100, 4 => 250}
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
              
              pdf.move_down(20)
              pdf.text "RELATÓRIO DE ATENDIMENTO" , :align => :center, :size => 18, :style => :bold
              pdf.text @place.first.name, :align => :center, :size => 12, :style => :bold
                        
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