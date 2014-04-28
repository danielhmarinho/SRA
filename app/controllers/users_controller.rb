# -*- encoding : utf-8 -*-
class UsersController < ApplicationController

  def new
    @user = User.new
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

end