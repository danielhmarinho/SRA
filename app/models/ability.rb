class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.as_user_type ==  'Aluno'
      can :manage, :all
    elsif user.as_user_type == 'Professor'
      can :create, Atendimento
    elsif user.as_user_type == 'Servidor'
      can [:edit, :create], Type
      can :read, :all
    elsif user.as_user_type == 'Comunidade'
      can :create, Atendimento
    end

  end
end

