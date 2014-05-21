# -*- encoding : utf-8 -*-
require 'cancan'
class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end


  protect_from_forgery
  include ApplicationHelper


  def after_sign_in_path_for(resource)
    if current_user.has_role? :administrative
      new_atendimento_path
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
    elsif current_user.has_role? :external_user
      new_atendimento_path
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
        redirect_to new_atendimento_path
      end
    rescue => e
      redirect_to root_path
    end
  end


  helper_method :redirect_as_controller

  def redirect_as_controller(format, path, notice)
    format.html { redirect_to path, notice }
  end


  helper_method :verify_user

  def verify_user user
    if user.has_role? :student
      "Aluno"
    elsif user.has_role? :professor
      "Professor"
    elsif user.has_role? :administrative
      "Servidor Administrativo"
    elsif user.has_role? :external_user
      "Usuário Externo"
    end  
  end

  helper_method :filter_atendimentos

  def filter_atendimentos(params)
      # The Atendimento date is datetime on the schema, so we need to convert it
      start_date = DateTime.strptime(params[:start_date], "%d/%m/%Y")
      end_date = DateTime.strptime("#{params[:end_date]} 23:59:59", "%d/%m/%Y %H:%M:%S")
      place_id = params[:place]

      @place = Place.where(:id => place_id) 

      atendimentos = Atendimento.where(created_at: start_date...end_date, place_id: place_id)
  end
end
