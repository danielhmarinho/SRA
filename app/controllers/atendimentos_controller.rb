class AtendimentosController < ApplicationController
  # GET /atendimentos
  # GET /atendimentos.json
  def index
    @atendimentos = Atendimento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atendimentos }
    end
  end

  # GET /atendimentos/1
  # GET /atendimentos/1.json
  def show
    @atendimento = Atendimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @atendimento }
    end
  end

  # GET /atendimentos/new
  # GET /atendimentos/new.json
  def new
    @atendimento = Atendimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @atendimento }
    end
  end

  # GET /atendimentos/1/edit
  def edit
    @atendimento = Atendimento.find(params[:id])
  end

  # POST /atendimentos
  # POST /atendimentos.json
  def create
    @atendimento = Atendimento.new(params[:atendimento])

    respond_to do |format|
      if @atendimento.save
        format.html { redirect_to atendimentos_url, notice: 'Atendimento criado com sucesso.' }
        format.json { render json: @atendimento, status: :created, location: @atendimento }
      else
        format.html { render action: "new" }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /atendimentos/1
  # PUT /atendimentos/1.json
  def update
    @atendimento = Atendimento.find(params[:id])

    respond_to do |format|
      if @atendimento.update_attributes(params[:atendimento])
        format.html { redirect_to @atendimento, notice: 'Atendimento alterado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /atendimentos/1
  # DELETE /atendimentos/1.json
  def destroy
    @atendimento = Atendimento.find(params[:id])
    @atendimento.destroy

    respond_to do |format|
      format.html { redirect_to atendimentos_url }
      format.json { head :no_content }
    end
  end
end
