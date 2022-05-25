require 'rails_helper'

RSpec.describe Entity, type: :model do
  before(:all) do
    @user = User.new(id: 1, name: "John doe", email: "john@gmail.com", password: 123456)
    @group = Group.new(id: 1, name: 'Category 1', icon: "Food", user: @user)
    @entity = Entity.new(id: 1, name: 'transaction 1', amount: 100, user: @user, group_id: @group)
  end

  describe 'model' do
    it 'should be a valid name' do
      @entity.name = 'transaction 1'
      expect(@entity).to be_valid
    end
    
    it 'should have valid amount' do
      @entity.amount = 100
      expect(@entity).to be_valid
    end
  end
end
