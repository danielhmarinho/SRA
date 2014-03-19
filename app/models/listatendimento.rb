  # -*- encoding : utf-8 -*-

  require "prawn"
  require 'prawn/layout'

class Listatendimento < ActiveRecord::Base
  
    attr_accessor :path
    attr_accessor :atendimentos_data

    def initialize(path = nil, atendimentos_data)
      @path = path
      @atendimentos_data = atendimentos_data
    end

    PDF_OPTIONS = {
        :page_size   => "A4",
        :page_layout => :landscape,
        :margin      => [20, 20]
    }

    def pdf
      
      Prawn::Document.new(PDF_OPTIONS) do |pdf|
          
          pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 65], :width  => pdf.bounds.width, :height => 460 do
            pdf.table(atendimentos_data, :header => true)      
          end

          pdf.page_count.times do |i|
            pdf.go_to_page(i+1)
            pdf.draw_text "#{i+1} / #{pdf.page_count}", :at=>[1,1] 
          end

          pdf.repeat :all do

            #Header Title
            pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width  => pdf.bounds.width do
              pdf.image "#{Rails.root}/app/assets/images/UnB.png", :vposition => 10
              pdf.move_up(10)
              pdf.text "Universidade de Brasília - Faculdade Gama", :align => :center
              pdf.move_down(15)
              pdf.stroke_horizontal_rule       
            end

            #Footer
            pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
              pdf.stroke_horizontal_rule
              pdf.move_down(5)
              pdf.text "Brasília, #{Time.now.strftime("%d/%m/%Y")}", :align => :center
            end
          end
      end
    end

  def save
    pdf.render_file(path)
  end

end


