# -*- encoding : utf-8 -*-
class ServidorsController < ApplicationController
  # GET /servidors
  # GET /servidors.json
  load_and_authorize_resource

  def index
    @servidors = Servidor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @servidors }
    end
  end



  # GET /servidors/new
  # GET /servidors/new.json
  def new
    @servidor = Servidor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @servidor }
    end
  end

  # GET /servidors/1/edit
  def edit
    @servidor = Servidor.find(params[:id])
  end

  # POST /servidors
  # POST /servidors.json
  def create
    @servidor = Servidor.new(params[:servidor])

    respond_to do |format|
      if @servidor.save
        format.html { redirect_to servidors_url, notice: 'Servidor criado com sucesso.' }
        format.json { render json: @servidor, status: :created, location: @servidor }
      else
        format.html { render action: "new" }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /servidors/1
  # PUT /servidors/1.json
  def update
    @servidor = Servidor.find(params[:id])

    respond_to do |format|
      if @servidor.update_attributes(params[:servidor])

        @user = User.find(current_user.id)
        if @user.update_attributes(params[:user])
          sign_in @user, :bypass => true
          format.html { redirect_to servidors_url, notice: 'Servidor alterado com sucesso.' }
          format.json { head :no_content }
        else
          format.html { redirect_to servidors_url, notice: 'Servidor alterado com sucesso.' }
          format.json { head :no_content }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @servidor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /servidors/1
  # DELETE /servidors/1.json
  def destroy
    @servidor = Servidor.find(params[:id])
    @servidor.destroy

    respond_to do |format|
      format.html { redirect_to servidors_url, notice: 'Servidor deletado com sucesso.' }
      format.json { head :no_content }
    end
  end
end
