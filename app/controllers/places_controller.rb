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
      respond_redirect_save(format)
    end
  end


  def update
    @place = Place.find(params[:id])


    respond_to do |format|
      respond_redirect_update(format)
    end
  end


  def destroy
    @place = Place.find(params[:id])
    @place.set_status

    respond_to do |format|
      redirect_as_controller(format, places_path, notice: "Local de Atendimento %s com sucesso." % (@place.active ? "habilitado" : "desabilitado"))
    end
  end

  def respond_redirect_save(format)
    if @place.save
      redirect_as_controller(format, places_path, notice: 'Local de Atendimento criado com sucesso.')
    else
      @type = Type.all
      format.html { render 'new' }
    end
  end

  def respond_redirect_update(format)
    if @place.update_attributes(params[:place])
      redirect_as_controller(format, places_path, notice: 'Local de Atendimento alterado com sucesso.')
    else
      format.html { render 'edit' }
    end
  end
end
