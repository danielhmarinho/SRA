# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  # Class variable to keep the html page that made the update request of user
  @@html_update_request = "any html page"

  def new
    @user = User.new
  end

  def index
    @user = User.new
  end

  def edit
    @@html_update_request = request.env["HTTP_REFERER"]

    if !user_signed_in? or current_user.has_role? :external_user
      @user = User.find(params[:id])
    else
      flash[:error] = 'Você não possui permissão para acessar esta área'
      redirect_as_user(current_user)
    end
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

  def respond_redirect_save(format)
    if @user.save
      redirect_as_controller(format, root_path, notice: 'Usuário Externo criado com sucesso.')
    else
      format.html { render action: "new" }
    end
  end

  def respond_redirect_update(format)
    if @user.update_attributes(params[:user])
      if @@html_update_request == "http://localhost:3000/users"
        redirect_as_controller(format, root_path, notice: 'Usuário Externo alterado com sucesso.')
      else
        redirect_as_controller(format, new_atendimento_path, notice: 'Usuário atualizado com sucesso.')
      end
    else
      format.html { render action: "edit" }
    end

  end
end
