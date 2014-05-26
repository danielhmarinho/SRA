# -*- encoding : utf-8 -*-
class PlacesController < ApplicationController

  load_and_authorize_resource

  def index
    @places = Place.ordened
    @types = Type.all
  end

  def new
    @place = Place.new
    @type = Type.all
  end

  def edit
    @place = Place.find(params[:id])
    @type = Type.all
  end


  def create
    @place = Place.new(params[:place])

    respond_to do |format|
      if @place.save
        redirect_as_controller(format, places_path, notice: 'Local de Atendimento criado com sucesso.')
      else
        format.html { render 'new' }
      end
    end
  end


  def update
    @place = Place.find(params[:id])


    respond_to do |format|
      if @place.update_attributes(params[:place])
        redirect_as_controller(format, places_path, notice: 'Local de Atendimento alterado com sucesso.')
      else
        format.html { render 'edit' }
      end
    end
  end


  def destroy
    @place = Place.find(params[:id])
    @place.update_attributes(active: !@place.active)
    @place.save

    respond_to do |format|
      redirect_as_controller(format, places_path, notice: "Local de Atendimento %s com sucesso." % (@place.active ? "habilitado" : "desabilitado"))
    end
  end
end
