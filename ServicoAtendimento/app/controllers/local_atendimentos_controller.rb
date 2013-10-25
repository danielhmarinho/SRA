class LocalAtendimentosController < ApplicationController
  # GET /local_atendimentos
  # GET /local_atendimentos.json
  def index
    @local_atendimentos = LocalAtendimento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @local_atendimentos }
    end
  end

  # GET /local_atendimentos/1
  # GET /local_atendimentos/1.json
  def show
    @local_atendimento = LocalAtendimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @local_atendimento }
    end
  end

  # GET /local_atendimentos/new
  # GET /local_atendimentos/new.json
  def new
    @local_atendimento = LocalAtendimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @local_atendimento }
    end
  end

  # GET /local_atendimentos/1/edit
  def edit
    @local_atendimento = LocalAtendimento.find(params[:id])
  end

  # POST /local_atendimentos
  # POST /local_atendimentos.json
  def create
    @local_atendimento = LocalAtendimento.new(params[:local_atendimento])

    respond_to do |format|
      if @local_atendimento.save
        format.html { redirect_to @local_atendimento, notice: 'Local atendimento was successfully created.' }
        format.json { render json: @local_atendimento, status: :created, location: @local_atendimento }
      else
        format.html { render action: "new" }
        format.json { render json: @local_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /local_atendimentos/1
  # PUT /local_atendimentos/1.json
  def update
    @local_atendimento = LocalAtendimento.find(params[:id])

    respond_to do |format|
      if @local_atendimento.update_attributes(params[:local_atendimento])
        format.html { redirect_to @local_atendimento, notice: 'Local atendimento was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @local_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /local_atendimentos/1
  # DELETE /local_atendimentos/1.json
  def destroy
    @local_atendimento = LocalAtendimento.find(params[:id])
    @local_atendimento.destroy

    respond_to do |format|
      format.html { redirect_to local_atendimentos_url }
      format.json { head :no_content }
    end
  end
end
