# -*- encoding : utf-8 -*-
class TypesController < ApplicationController

  load_and_authorize_resource :except => [:type_by_place]

  def index
    @types = Type.all(:order => ('name ASC'))

  end

  def new
    @type = Type.new
  end


  def edit
    @type = Type.find(params[:id])
  end


  def create
    @type = Type.new(params[:type])

    respond_to do |format|
      if @type.save
        redirect_as_type(format, notice: 'Tipo de Atendimento criado com sucesso.')
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @type = Type.find(params[:id])

    respond_to do |format|
      if @type.update_attributes(params[:type])
        redirect_as_type(format, notice: 'Tipo de Atendimento alterado com sucesso.')

      else
        format.html { render action: "edit" }
      end
    end
  end


  def destroy
    @type = Type.find(params[:id])
    @type.destroy

    respond_to do |format|
      redirect_as_type(format, notice: 'Tipo de Atendimento deletado com sucesso.')
    end
  end

  def type_by_place
    @type = Place.find(params[:id]).types.order('name ASC')

    respond_to do |format|
      format.js { render json: @type }
    end
  end
end