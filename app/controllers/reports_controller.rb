# -*- encoding : utf-8 -*-
require "prawn"
include Pdf

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


  def generate_data(params)

    atendimentos_data = [ Pdf.format_titles( ["Nome", "Matrícula", "Data/Hora", "Público-alvo", "Tipo de Atendimento"] ) ]

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


  def pdf(atendimentos_data, has_image)

    pdf_options = {
      :page_size => "A4",
      :page_layout => :landscape,
      :margin => [20, 20]
    }

    Prawn::Document.new(pdf_options) do |pdf|
      Pdf.generate_pdf_layout(pdf, has_image, atendimentos_data)

      Pdf.count_pdf_pages(pdf)

      pdf.repeat :all do
        Pdf.generate_pdf_header(pdf, @place.first.name)

        Pdf.generate_pdf_footer(pdf,current_user.name)
      end
    end
  end

end
