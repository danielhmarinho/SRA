class PermissionsController < ApplicationController

	def index
		@user = User.all
  end

  def edit
    @user = User.find(params[:id])
  end
end
