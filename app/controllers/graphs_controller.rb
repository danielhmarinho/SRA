# -*- encoding : utf-8 -*-
class GraphsController < ApplicationController
  load_and_authorize_resource   

  def show
    #graph = Graph.new
    @graph = Graph.find(params[:id])
    filter_attributes = {}
    
    filter_attributes[:start_date] = @graph.start_date
    filter_attributes[:end_date] = @graph.end_date
    filter_attributes[:place] = @graph.place
    
    @atendimentos = filter_atendimentos filter_attributes
    @types = get_types
    
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @graph }
    end
  end

  def new
    @graph = Graph.new
  end

  def create
      start_date = params[:graph][:start_date]
      end_date = params[:graph][:end_date]
      place = params[:graph][:place]
      @graph = Graph.create(params[:graph])
                  
      redirect_to return_path   
  end

  private

    def return_path
      if @graph.valid?
        graph_path(@graph.id)
      else
        @graph.errors.each do |key, error|
          flash[:error] = "O gráfico não pode ser gerado: #{error}"
        end
        new_graph_path
      end
    end

    def get_types
      type_ids = []

      @atendimentos.each do |atendimento|
        type_ids.push atendimento.type
      end

      Type.where(:id => type_ids)
    end

end
