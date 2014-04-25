#encoding : utf-8 
class GraphsController < ApplicationController
      

  def show
    @graph = @atendimentos
    #graph = Graph.new
   


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
           @atendimentos = filter_atendimentos params[:graph]
           redirect_to graph_path(1)
 
      end


  end

  


end
