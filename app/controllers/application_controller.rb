# -*- encoding : utf-8 -*-
require 'cancan'
class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || stored_location_for(resource) || new_atendimento_path
  end

  rescue_from CanCan::AccessDenied do |exception|
    flash[:error] = exception.message
    redirect_to root_url
  end

end
