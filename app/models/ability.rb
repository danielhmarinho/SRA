class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.has_role?  :student
      can :create, Atendimento
    end
    
    if user.has_role?  :professor
      can :create, Atendimento
    end
    if user.has_role? :administrative
      can [:read, :create], [Atendimento]
      can [:edit, :update], Atendimento
      can :manage, [Type, Place, Report]
     end
    if user.has_role? :admin
      can :manage, :all
    end
  end
end

