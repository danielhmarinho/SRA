class GraphsController < ApplicationController

  def show
    @graph = Graph.find(params[:id])

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

    respond_to do |format|
      if @graph.save
        format.html { redirect_to @graph, notice: 'Graph was successfully created.' }
        format.json { render json: @graph, status: :created, location: @graph }
      else
        format.html { render action: "new" }
        format.json { render json: @graph.errors, status: :unprocessable_entity }
      end
    end
  end

end
