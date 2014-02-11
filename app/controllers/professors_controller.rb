# -*- encoding : utf-8 -*-
class ProfessorsController < ApplicationController
  # GET /professors
  # GET /professors.json
  load_and_authorize_resource

  def index
    @professors = Professor.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @professors }
    end
  end

  # GET /professors/new
  # GET /professors/new.json
  def new
    @professor = Professor.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @professor }
    end
  end

  # GET /professors/1/edit
  def edit
    @professor = Professor.find(params[:id])
  end

  # POST /professors
  # POST /professors.json
  def create
    @professor = Professor.new(params[:professor])

    respond_to do |format|
      if @professor.save
        format.html { redirect_to professors_url, notice: 'Professor foi criado com sucesso.' }
        format.json { render json: @professor, status: :created, location: @professor }
      else
        format.html { render action: "new" }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /professors/1
  # PUT /professors/1.json
  def update
    @professor = Professor.find(params[:id])

    respond_to do |format|
      if @professor.update_attributes(params[:professor])


        @user = User.find(current_user.id)
        if @user.update_attributes(params[:user])
          sign_in @user, :bypass => true
          format.html { redirect_to professors_url, notice: 'Professor foi atualizado com sucesso.' }
          format.json { head :no_content }
        else
          format.html { redirect_to professors_url, notice: 'Professor foi atualizado com sucesso.' }
          format.json { head :no_content }
        end

      else
        format.html { render action: "edit" }
        format.json { render json: @professor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /professors/1
  # DELETE /professors/1.json
  def destroy
    @professor = Professor.find(params[:id])
    @professor.destroy

    respond_to do |format|
      format.html { redirect_to professors_url, notice: 'Professor deletado com sucesso.' }
      format.json { head :no_content }
    end
  end
end
