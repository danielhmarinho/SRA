class UsersController < ApplicationController

	def index
		@user = User.where("id NOT IN (?)", User.with_role(:student))
  end

  def edit
    @user = User.find(params[:id])
  end
end
