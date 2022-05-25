require 'rails_helper'

RSpec.describe Group, type: :model do
  before(:all) do
    @user = User.new(id: 1, name: "John doe", email: "john@gmail.com", password: 123456)
    @group = Group.new(id: 2,name: 'Category 1', icon: "Food", user: @user)
  end

  describe 'model' do
    it 'should be a valid name' do
      @group.name = 'Category 1'
      expect(@group).to be_valid
    end
    
    it 'should have valid icon' do
      @group.icon = 'Food'
      expect(@group).to be_valid
    end
  end
end
