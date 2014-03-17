  # -*- encoding : utf-8 -*-

  require "prawn"
  require 'prawn/layout'

class Listatendimento < ActiveRecord::Base
  
    attr_accessor :path
    attr_accessor :atendimentos_relatorio

    def initialize(path = nil, atendimentos_relatorio)
      @path = path
      @atendimentos_relatorio = atendimentos_relatorio
    end

    PDF_OPTIONS = {
        :page_size   => "A4",
        :page_layout => :landscape,
        :margin      => [40, 40]
    }

  

    def pdf
      Prawn::Document.new(PDF_OPTIONS) do |pdf|

          pdf.fill_color "000000"
          pdf.text "Sistema de Registro de Atendimentos", :size => 22, :style => :bold, :align => :center

          pdf.move_down 20
          pdf.text "Registros", :size => 20, :align => :center, :style => :bold


          data = [["Coluna 1", "Coluna 2", "Coluna 3"]] 

          atendimentos_relatorio.each do |atendimento|
            data += [["linha 0", "linha 1", "linha 2"]]  
          end

          pdf.table(data, :header => true)


          pdf.repeat :all do

            #Header
            pdf.bounding_box [pdf.bounds.left, pdf.bounds.top + 25], :width  => pdf.bounds.width do
              pdf.text "Universidade de Brasília - Faculdade Gama", :align => :center
              pdf.move_down(5)
              pdf.stroke_horizontal_rule 
              pdf.move_down(5)             
             end

            #Footer
            pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
              pdf.stroke_horizontal_rule
              pdf.move_down(5)
              pdf.text "Brasília, #{Time.now.strftime("%d/%m/%Y")}.", :align => :center
              
              pdf.page_count.times do |i|
                pdf.go_to_page(i+1)
                pdf.draw_text "#{i+1} / #{pdf.page_count}", :at=>[1,1] 
              end
            end

          end

      end
    end

  def save
    pdf.render_file(path)
  end

end


