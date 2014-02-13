# -*- encoding : utf-8 -*-
require 'cancan'
class ApplicationController < ActionController::Base


  protect_from_forgery
  include ApplicationHelper


  def after_sign_in_path_for(resource)
    if current_user.has_role? :administrative
      atendimentos_path
    elsif current_user.has_role? :student
      new_atendimento_path

    elsif current_user.has_role? :professor
      if current_user.has_role? :admin
        atendimentos_path
      else
        new_atendimento_path
      end
    elsif current_user.has_role? :admin
      atendimentos_path
    end


  end

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "Você não possui permissão para acessar esta área"
    flash[:error] = exception.message
    redirect_as_user (current_user)
  end


  def redirect_as_user(user)

    begin
      if current_user.has_role? :student
        redirect_to new_atendimento_path
      elsif current_user.has_role? :professor
        redirect_to new_atendimento_path
      elsif current_user.has_role? :administrative
        redirect_to atendimentos_path
      end
    rescue => e
      redirect_to root_path
    end
  end

  helper_method :redirect_as_place, :redirect_as_type

  def redirect_as_place(format, notice)
    format.html { redirect_to places_url, notice }
  end

  def redirect_as_type(format, notice)
    format.html { redirect_to types_url, notice }
  end

end