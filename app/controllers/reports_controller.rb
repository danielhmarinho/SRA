# -*- encoding : utf-8 -*-
require "prawn"
require 'prawn/layout'
require "RMagick"

class ReportsController < ApplicationController
  load_and_authorize_resource

  def new
    @report = Report.new
  end

  def create
    @report = Report.new(params[:report])

    check_if_report_is_valid

  end

  def check_if_report_is_valid
    if @report.valid?
      send_report_to_user
    else
      @report.errors.each do |key, error|
        flash[:error] = "O relatório não pode ser gerado: #{error}"
      end

    end
  end

  def send_report_to_user
    save_report(params[:report],false)

    path = Rails.root.join("app", "assets", "relatorio.pdf")
    send_file path, :filename => "RelatorioAtendimentos.pdf", :type => "application/pdf"

  end

  def save_report_with_graph

    histogram_graph = clean_svg_data(params[:graphs][:graph1])
    piechart_graph = clean_svg_data(params[:graphs][:graph2])
    filter_attributes = params[:graphs][:attributes]

    save_graph(histogram_graph, "graph1")
    save_graph(piechart_graph, "graph2")

    save_report(filter_attributes,true)

  end


  private

  def save_graph(svg, file_name)
    img = Magick::Image::from_blob(svg) { self.format = 'SVG'; }.first
    img.format = 'PNG'
    path = "#{Rails.root}/app/assets/images/#{file_name}.png"
    img.write(path)
  end

  def clean_svg_data(svg)
    svg_graph = svg.match(/<svg(.)*<\/svg>/)[0]
    svg_graph.gsub("'Lucida Grande', 'Lucida Sans Unicode, '", "")
  end

  def generate_data(params)

    atendimentos_data = [ format_titles( ["Nome", "Matrícula", "Data/Hora", "Público-alvo", "Tipo de Atendimento"] ) ]

    atendimentos = filter_atendimentos params

    generate_atendimentos_data(atendimentos, atendimentos_data)
  end

  def generate_atendimentos_data(atendimentos, atendimentos_data)
    atendimentos.each do |atendimento|
      user = atendimento.user
      role = User.verify_user user
      type = atendimento.type.name

      atendimentos_data += [[user.name, user.matricula, l(atendimento.try(:created_at), :format => :long), role, type ]]
    end

    atendimentos_data
  end

  def save_report(params, has_image)
    path = Rails.root.join("app", "assets", "relatorio.pdf")
    atendimentos_data = generate_data params

    pdf(atendimentos_data, has_image).render_file(path)
  end


  def format_titles(content)
    content.map do |cell|
      cell = "<font size='14'><b>#{cell}</b></font>"
    end
  end


  def pdf(atendimentos_data, has_image)

    pdf_options = {
      :page_size => "A4",
      :page_layout => :landscape,
      :margin => [20, 20]
    }

    Prawn::Document.new(pdf_options) do |pdf|
      generate_pdf_layout(pdf, has_image, atendimentos_data)

      count_pdf_pages(pdf)

      pdf.repeat :all do
        generate_pdf_header(pdf)

        generate_pdf_footer(pdf)
      end
    end
  end

  def generate_pdf_layout(pdf, has_image, atendimentos_data)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top - 90], :width => pdf.bounds.width, :height => 440 do
      if(has_image)
        add_image_to_pdf(pdf)
      end
      generate_pdf_columns_and_tables(pdf, atendimentos_data)

    end
  end

  def add_image_to_pdf(pdf)
    root = Rails.root
    pdf.image "#{root}/app/assets/images/graph1.png", :vposition => :center, :height => 300, :width => 900
    pdf.start_new_page
    pdf.image "#{root}/app/assets/images/graph2.png", :vposition => :center, :height => 230, :width => 900
    pdf.start_new_page
  end

  def generate_pdf_columns_and_tables(pdf, atendimentos_data)
    columns = { 0 => 190, 1 => 75, 2 => 185, 3 => 100, 4 => 250}
    pdf.table(atendimentos_data, :header => true, :cell_style => { :inline_format => true, :align => :center } ,:column_widths => columns )
  end

  def count_pdf_pages(pdf)
    pdf.page_count.times do |iterator|
      page = iterator+1
      pdf.go_to_page(page)
      pdf.draw_text "#{page} / #{pdf.page_count}", :at=>[1,1]
    end
  end

  def generate_pdf_header(pdf)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.top], :width => pdf.bounds.width do
      pdf.image "#{Rails.root}/app/assets/images/UNB4.jpg", :vposition => 10
      pdf.move_up(4)

      pdf.move_down(20)
      pdf.text "RELATÓRIO DE ATENDIMENTO" , :align => :center, :size => 18, :style => :bold
      pdf.text @place.first.name, :align => :center, :size => 12, :style => :bold
    end
  end

  def generate_pdf_footer(pdf)
    pdf.bounding_box [pdf.bounds.left, pdf.bounds.bottom + 40], :width => pdf.bounds.width do
      pdf.stroke_horizontal_rule
      pdf.move_down(5)
      pdf.text "Brasília, #{Time.now.strftime("%d/%m/%Y")}", :align => :center
      pdf.move_down(10)
      pdf.text "#{current_user.name}: ___________________________________________", :align => :center
    end
  end
end
