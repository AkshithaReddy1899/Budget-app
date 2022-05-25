class EntitiesController < ApplicationController
	load_and_authorize_resource
	def index
		@group = Group.find(params[:group_id])
		@entities = Entity.where(group_id: @group.id)
		@total_amount = 0
		@entities.each do |entity|
			@total_amount +=entity.amount
		end
	end

	def new
		@entity = Entity.new
	end

	def create
		@group = Group.find(params[:group_id])
		new_entity = Entity.create(entity_params)
		new_entity.user_id = current_user.id
		new_entity.group_id = @group.id
		if new_entity.save
			redirect_to group_entities_path(new_entity.group_id, new_entity.id)
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
