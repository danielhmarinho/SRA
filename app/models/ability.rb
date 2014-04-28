class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.has_role?  :student
      can :create, Atendimento
    end

    if user.has_role?  :external_user
      can :create, Atendimento
    end
    
    if user.has_role?  :professor
      can :create, Atendimento
    end

    if user.has_role? :manager
      can [:create, :read, :edit, :update], Atendimento
      can [:create, :read, :edit, :update], Type
      can [:create, :read, :edit, :update], Place
      can :manage, Report
      can :manage, Graph
    end

    if user.has_role? :administrative
      can :create, [Atendimento]
     end
    if user.has_role? :admin
      can :manage, :all
    end
  end
end

