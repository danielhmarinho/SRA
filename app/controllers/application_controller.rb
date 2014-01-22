# -*- encoding : utf-8 -*-
class ApplicationController < ActionController::Base
  protect_from_forgery

  def index

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @atendimentos }
    end
  end
end
