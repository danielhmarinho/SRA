class TipoAtendimentosController < ApplicationController
  # GET /tipo_atendimentos
  # GET /tipo_atendimentos.json
  def index
    @tipo_atendimentos = TipoAtendimento.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @tipo_atendimentos }
    end
  end

  # GET /tipo_atendimentos/1
  # GET /tipo_atendimentos/1.json
  def show
    @tipo_atendimento = TipoAtendimento.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tipo_atendimento }
    end
  end

  # GET /tipo_atendimentos/new
  # GET /tipo_atendimentos/new.json
  def new
    @tipo_atendimento = TipoAtendimento.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @tipo_atendimento }
    end
  end

  # GET /tipo_atendimentos/1/edit
  def edit
    @tipo_atendimento = TipoAtendimento.find(params[:id])
  end

  # POST /tipo_atendimentos
  # POST /tipo_atendimentos.json
  def create
    @tipo_atendimento = TipoAtendimento.new(params[:tipo_atendimento])

    respond_to do |format|
      if @tipo_atendimento.save
        format.html { redirect_to @tipo_atendimento, notice: 'Tipo de atendimento foi criado com sucesso.' }
        format.json { render json: @tipo_atendimento, status: :created, location: @tipo_atendimento }
      else
        format.html { render action: "new" }
        format.json { render json: @tipo_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /tipo_atendimentos/1
  # PUT /tipo_atendimentos/1.json
  def update
    @tipo_atendimento = TipoAtendimento.find(params[:id])

    respond_to do |format|
      if @tipo_atendimento.update_attributes(params[:tipo_atendimento])
        format.html { redirect_to @tipo_atendimento, notice: 'Tipo de atendimento foi atualizado com sucesso.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @tipo_atendimento.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_atendimentos/1
  # DELETE /tipo_atendimentos/1.json
  def destroy
    @tipo_atendimento = TipoAtendimento.find(params[:id])
    @tipo_atendimento.destroy

    respond_to do |format|
      format.html { redirect_to tipo_atendimentos_url }
      format.json { head :no_content }
    end
  end
end
