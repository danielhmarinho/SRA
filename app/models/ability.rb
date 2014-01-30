class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.as_user_type ==  'Aluno'
      can :manage, :all
    elsif user.as_user_type == 'Professor'
      can :create, Atendimento
    elsif user.as_user_type == 'Servidor'
      can :manage, Type
      can :manage, Place
      can :manage, Servidor
      can :manage, Professor
      can :read, :all
      can [:edit, :update], Atendimento
    end

  end
end

