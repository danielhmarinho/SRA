# -*- encoding: utf-8 -*-
class PermissionsController < ApplicationController
  authorize_resource :class => false
  def index
    @user = User.joins(:roles).where(roles: {:name => [:administrative, :professor]})
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        redirect_as_controller(format, permission_path, notice: "Permissões alteradas com sucesso")
      else
        format.html { render 'edit' }

      end
    end
  end
end
