class GroupsController < ApplicationController
  has_and_belongs_to_many :entities
  def index
  end
end
