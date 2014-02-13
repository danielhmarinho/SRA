# -*- encoding : utf-8 -*-
class PlacesController < ApplicationController

  load_and_authorize_resource

  def index
    @places = Place.all(:order => 'name ASC')
  end



  def new
    @place = Place.new
  end

  def edit
    @place = Place.find(params[:id])
  end


  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        redirect_as_place(format, notice: 'Local de Atendimento criado com sucesso.')
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        redirect_as_place(format, notice: 'Local de Atendimento alterado com sucesso.')
      else
        format.html { render action: "edit" }
      end
    end
  end


  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      redirect_as_place(format, notice: 'Local de Atendimento deletado com sucesso.')
    end
  end


end