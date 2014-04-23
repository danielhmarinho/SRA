class UserController < ApplicationController

	def index
		@user = User.find_by_role(:funcionario)
	end
end
