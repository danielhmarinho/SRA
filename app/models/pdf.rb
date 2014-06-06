#encoding: utf-8
require "prawn"
require 'prawn/layout'
require "RMagick"

module Pdf


  def self.format_titles(content)
    content.map do |cell|
      cell = "<font size='14'><b>#{cell}</b></font>"
    end
  end

  def self.add_image_to_pdf(pdf)
    root = Rails.root
    pdf.image "#{root}/app/assets/images/graph1.png", :vposition => :center, :height => 300, :width => 900
    pdf.start_new_page
    pdf.image "#{root}/app/assets/images/graph2.png", :vposition => :center, :height => 230, :width => 900
    pdf.start_new_page
  end

  def self.clean_svg_data(svg)
    svg_graph = svg.match(/<svg(.)*<\/svg>/)[0]
    svg_graph.gsub("'Lucida Grande', 'Lucida Sans Unicode, '", "")
  end


  def self.count_pdf_pages(pdf)
    pdf.page_count.times do |iterator|
      page = iterator+1
      pdf.go_to_page(page)
      pdf.draw_text "#{page} / #{pdf.page_count}", :at=>[1,1]
    end
  end

  def self.generate_pdf_layout(pdf, has_image, atendimentos_data)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 90], :width => pdf.bounds.width, :height => 440 do
      if(has_image)
        Pdf.add_image_to_pdf(pdf)
      end
      Pdf.generate_pdf_columns_and_tables(pdf, atendimentos_data)

    end
  end


  def self.generate_pdf_columns_and_tables(pdf, atendimentos_data)
    columns = { 0 => 190, 1 => 75, 2 => 185, 3 => 100, 4 => 250}
    pdf.table(atendimentos_data, :header => true, :cell_style => { :inline_format => true, :align => :center } ,:column_widths => columns )
  end

  def self.generate_pdf_header(pdf, place_name)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width do
      pdf.image "#{Rails.root}/app/assets/images/UNB4.jpg", :vposition => 10
      pdf.move_up(4)

      pdf.move_down(20)
      pdf.text "RELATÓRIO DE ATENDIMENTO" , :align => :center, :size => 18, :style => :bold
      pdf.text place_name, :align => :center, :size => 12, :style => :bold
    end
  end

  def self.generate_pdf_footer(pdf, current_user_name)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 40], :width => pdf.bounds.width do
      pdf.stroke_horizontal_rule
      pdf.move_down(5)
      pdf.text "Brasília, #{Time.now.strftime("%d/%m/%Y")}", :align => :center
      pdf.move_down(10)
      pdf.text "#{current_user_name}: ___________________________________________", :align => :center
    end
  end

end
