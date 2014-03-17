  # -*- encoding : utf-8 -*-

  require "prawn"
  require 'prawn/layout'
class Listatendimento < ActiveRecord::Base
    attr_accessor :path

    def initialize(path = nil)
      @path = path
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


          pdf.repeat :all do

            pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 25], :width  => pdf.bounds.width do
              pdf.stroke_horizontal_rule
              pdf.move_down(5)
              pdf.text "Brasília , #{Time.now.strftime("%d/%m/%Y")}.", :align => :center
              #pdf.text "#{current_user.first_name}", :size => 10
             end
          end

      end
    end
  def save
    pdf.render_file(path)
  end

end


