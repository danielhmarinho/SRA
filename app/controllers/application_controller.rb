# -*- encoding : utf-8 -*-
require 'cancan'
class ApplicationController < ActionController::Base
  rescue_from DeviseLdapAuthenticatable::LdapException do |exception|
    render :text => exception, :status => 500
  end


  protect_from_forgery
  include ApplicationHelper


  def after_sign_in_path_for(resource)
    if current_user.nil?
      root_path
    elsif current_user.has_role? :administrative or  current_user.has_role? :student or current_user.has_role? :professor or current_user.has_role? :manager or current_user.has_role? :external_user or current_user.has_role? :admin
      new_atendimento_path
    else
      flash.discard(:notice)
      flash[:error] = "Não foi possível recuperar informações do usuário. Procure o CPD."
      sign_out resource
      root_path
    end
  end

  rescue_from CanCan::AccessDenied do |exception|
    exception.default_message = "Você não possui permissão para acessar esta área"
    flash[:error] = exception.message
    redirect_as_user (current_user)
  end


  def redirect_as_user(user)

    begin
      user
      if current_user.nil?
        redirect_to root_path
      elsif current_user.has_role? :student or current_user.has_role? :professor or current_user.has_role? :administrative or current_user.has_role? :manager or current_user.has_role? :external_user or current_user.has_role? :admin
        redirect_to new_atendimento_path
      else
        redirect_to root_path
      end
    rescue => e
      redirect_to root_path

    end
  end


  helper_method :redirect_as_controller

  def redirect_as_controller(format, path, notice)
    format.html { redirect_to path, notice }
  end

  helper_method :filter_atendimentos

  def filter_atendimentos(params)
    # The Atendimento date is datetime on the schema, so we need to convert it
    start_date = DateTime.strptime(params[:start_date], "%d/%m/%Y")
    end_date = DateTime.strptime("#{params[:end_date]} 23:59:59", "%d/%m/%Y %H:%M:%S")
    place_id = params[:place]

    @place = Place.find(place_id)

    atendimentos = Atendimento.where(created_at: start_date...end_date, place_id: place_id)
  end


end
