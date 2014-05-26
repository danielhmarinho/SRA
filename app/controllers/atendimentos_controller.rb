# -*- encoding : utf-8 -*-
class AtendimentosController < ApplicationController
  load_and_authorize_resource

  # GET /atendimentos
  # GET /atendimentos.json
  def index
    @atendimentos = Atendimento.order(:created_at)
  end

  # GET /atendimentos/new
  # GET /atendimentos/new.json
  def new
    @atendimento = Atendimento.new
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
        redirect_as_controller(format, new_atendimento_path, notice: 'Atendimento criado com sucesso')
      else
        format.html { render 'new' }
      end
    end
  end

  # PUT /atendimentos/1
  # PUT /atendimentos/1.json
  def update
    @atendimento = Atendimento.find(params[:id])

    respond_to do |format|
      if @atendimento.update_attributes(params[:atendimento])
        redirect_as_controller(format, atendimentos_path, notice: 'Atendimento alterado com sucesso')
      else
        format.html { render 'edit' }

      end
    end
  end

  # DELETE /atendimentos/1
  # DELETE /atendimentos/1.json
  def destroy
    @atendimento = Atendimento.find(params[:id])
    @atendimento.destroy

    respond_to do |format|
      redirect_as_controller(format, atendimentos_path, notice: 'Atendimento deletado com sucesso')
    end
  end
end
