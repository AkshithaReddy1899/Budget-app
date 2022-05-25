class EntitiesController < ApplicationController
	load_and_authorize_resource
	def index
		@entities = current_user.entities
		@total_amount = 0
		@entities.each do |entity|
			@total_amount +=entity.amount
		end
	end

	def new
		@entity = Entity.new
	end

	def create
		new_entity = Entity.create(entity_params)
		new_entity.user_id = current_user.id
		if new_entity.save
			redirect_to entity_path(new_entity.id)
			flash[:success] = "New transaction added!"
		else
			redirect_to new_entity_path
			flash[:alert] = "Category not added. Try again!"
		end
	end

	def entity_params
		params.require(:entity).permit(:name, :amount)
	end
end
