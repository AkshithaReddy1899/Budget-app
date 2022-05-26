require 'rails_helper'

RSpec.describe User, type: :model do
  before(:all) do
    @user = User.new(name: 'John doe', email: 'john@gmail.com', password: 123_456)
  end

  describe 'model' do
    it 'should be a valid name' do
      @user.name = 'John doe'
      expect(@user).to be_valid
    end

    it 'should have valid email' do
      @user.email = 'john@gmail.com'
      expect(@user).to be_valid
    end
  end
end
