# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  

  
  def new
    @user = User.new
  end


  def edit
    @user = User.find(params[:id])
  end


  def create
    @user = User.new(params[:user])

    @user.add_role :external_user
    @user.external_user = true
    @user.encrypted_password = Digest::MD5::hexdigest params[:user][:password]

    respond_to do |format|
      if @user.save
        redirect_as_controller(format, root_path, notice: 'Usuário Externo criado com sucesso.')
      else
        format.html { render action: "new" }
      end
    end
  end


  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        redirect_as_controller(format, users_path, notice: 'Usuário Externo alterado com sucesso.')
      else
        format.html { render action: "edit" }
      end
    end
  end


  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      redirect_as_controller(format, users_path, notice: 'Usuário Externo removido com sucesso.')
    end
  end

end