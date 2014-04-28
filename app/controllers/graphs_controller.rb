# -*- encoding : utf-8 -*-
class GraphsController < ApplicationController
  load_and_authorize_resource   

  def show
    @graph = Graph.find(params[:id])
    filter_attributes = {}
    
    filter_attributes[:start_date] = @graph.start_date
    filter_attributes[:end_date] = @graph.end_date
    filter_attributes[:place] = @graph.place
    
    @atendimentos = filter_atendimentos filter_attributes
  end

  def new
    @graph = Graph.new
    Graph.destroy_all
  end

  def create
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

end
