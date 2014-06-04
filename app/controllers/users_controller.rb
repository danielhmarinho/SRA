# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def index
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
  end

  def retrieve_password
    cpf_confirmation = params[:user][:matricula]
    user = User.where(:matricula => cpf_confirmation)

    respond_to do |format|
      if user.first
        redirect_as_controller(format, edit_user_path(user.first), notice: 'CPF encontrado.')
      else
        flash[:error] = 'CPF não encontrado'
        redirect_as_controller(format, users_path, error: '')
      end
    end
  end

  def create
    @user = User.new(params[:user])

    @user.add_role :external_user
    @user.external_user = true
    @user.encrypted_password = Digest::MD5::hexdigest params[:user][:password]

    respond_to do |format|
      respond_redirect_save(format)
    end
  end

  def update
    @user = User.find(params[:id])
    @user.encrypted_password = Digest::MD5::hexdigest params[:user][:password]

    respond_to do |format|
      respond_redirect_update(format)
    end
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      redirect_as_controller(format, users_path, notice: 'Usuário Externo removido com sucesso.')
    end
  end

  def respond_redirect_save(format)
    if @user.save
      redirect_as_controller(format, root_path, notice: 'Usuário Externo criado com sucesso.')
    else
      format.html { render action: "new" }
    end
  end

  def respond_redirect_update(format)
    if @user.update_attributes(params[:user])
      redirect_as_controller(format, root_path, notice: 'Usuário Externo alterado com sucesso.')

    else
      format.html { render action: "edit" }
    end

  end
end
