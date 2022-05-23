class UsersController < ApplicationController
	protect_from_forgery except: :sample
	def index
		@user = current_user
	end
end
