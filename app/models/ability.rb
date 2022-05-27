class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new
    case user.role
    when 'admin'
      can :manage, :all
    when 'author'
      can :manage, [Group, Entity], user_id: user.id
      can :read, [Group, Entity]
      can :create, [Group, Entity]
      can :destroy, [Group, Entity]
    end
  end
end
