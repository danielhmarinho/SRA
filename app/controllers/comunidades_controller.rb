class ComunidadesController < ApplicationController
  # GET /comunidades
  # GET /comunidades.json
  def index
    @comunidades = Comunidade.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @comunidades }
    end
  end

  # GET /comunidades/1
  # GET /comunidades/1.json
  def show
    @comunidade = Comunidade.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @comunidade }
    end
  end

  # GET /comunidades/new
  # GET /comunidades/new.json
  def new
    @comunidade = Comunidade.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @comunidade }
    end
  end

  # GET /comunidades/1/edit
  def edit
    @comunidade = Comunidade.find(params[:id])
  end

  # POST /comunidades
  # POST /comunidades.json
  def create
    @comunidade = Comunidade.new(params[:comunidade])

    respond_to do |format|
      if @comunidade.save
        format.html { redirect_to comunidades_url, notice: 'Comunidade was successfully created.' }
        format.json { render json: @comunidade, status: :created, location: @comunidade }
      else
        format.html { render action: "new" }
        format.json { render json: @comunidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /comunidades/1
  # PUT /comunidades/1.json
  def update
    @comunidade = Comunidade.find(params[:id])

    respond_to do |format|
      if @comunidade.update_attributes(params[:comunidade])
        format.html { redirect_to comunidades_url, notice: 'Comunidade was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @comunidade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comunidades/1
  # DELETE /comunidades/1.json
  def destroy
    @comunidade = Comunidade.find(params[:id])
    @comunidade.destroy

    respond_to do |format|
      format.html { redirect_to comunidades_url }
      format.json { head :no_content }
    end
  end
end
