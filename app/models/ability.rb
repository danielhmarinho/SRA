class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.as_user_type ==  'Aluno'
      can :manage, :all
    elsif user.as_user_type == 'Professor'
      can :create, Atendimento
    elsif user.as_user_type == 'Servidor'
      can [:edit, :update, :create], Type
      can [:edit, :update], Place
      can :read, :all
      can [:create], Atendimento
      can :manage, Professor
      can :manage, Servidor
    end

  end
end

