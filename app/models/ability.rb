class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.as_user_type ==  'Aluno'
      can :create, Atendimento
    elsif user.as_user_type == 'Professor'
      can :create, Atendimento
    elsif user.as_user_type == 'Servidor'
      can [:read, :edit, :create, :update], [Atendimento, Professor, Aluno, Servidor]
      can :manage, [Type, Place]
    end

  end
end

