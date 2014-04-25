# -*- encoding: utf-8 -*-
class PermissionsController < ApplicationController
  authorize_resource :class => false
  def index
    @user = User.where(User.arel_table[:id].not_eq(current_user.id))
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        redirect_as_controller(format, permission_path, notice: 'Permissões alteradas com sucesso')
      else
        format.html { render action: "edit" }

      end
    end
  end
end
