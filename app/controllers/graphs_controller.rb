#encoding : utf-8 
class GraphsController < ApplicationController
      

  def show
    #@graph = Graph.find(params[:id])
    @graph = Graph.new
  

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @graph }
    end
  end

  def new
    
    @graph = Graph.new

  end

  def create
    @graph = Graph.new(params[:graph])
      
        @atendimentos = Atendimento.new
          
        if @graph.valid?
         @atendimentos = filter_graphs
          redirect_to graph_path(1)

      end


  end

  def filter_graphs
      # The Atendimento date is datetime on the schema, so we need to convert it
      start_date = DateTime.strptime(params[:graph][:start_date], "%d/%m/%Y")
      end_date = DateTime.strptime("#{params[:graph][:end_date]} 23:59:59", "%d/%m/%Y %H:%M:%S")
      place_id = params[:graph][:place]

      @place = Place.where(:id => place_id) 

      atendimentos = Atendimento.where(data: start_date...end_date, place_id: place_id)
    end


end
