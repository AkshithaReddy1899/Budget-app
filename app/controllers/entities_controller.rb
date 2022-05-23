class EntitiesController < ApplicationController
	load_and_authorize_resource
	
	has_and_belongs_to_many :groups
end
