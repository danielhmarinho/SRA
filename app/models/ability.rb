class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.as_user_type ==  'Aluno'
      can :create, Atendimento
    elsif user.as_user_type == 'Professor'
      can :create, Atendimento
    elsif user.as_user_type == 'Servidor'
      can [:read, :edit, :create, :update], [Atendimento,Type, Professor, Aluno, Place, Servidor]
    end

  end
end

