class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user

    if user.as_user_type ==  'Aluno'
      can :create, Atendimento
    end
    
    if user.as_user_type == 'Professor'
      can :create, Atendimento
      can [:edit, :update], Professor do |professor|
        professor.try(:user) == user
      end
    end
    if user.as_user_type == 'Servidor'
      can [:read, :create], [Atendimento, Professor, Aluno, Servidor]
      can [:edit, :update], Atendimento
      can :manage, [Type, Place]
      can [:edit, :update], Servidor do |servidors|
        servidors.try(:user) == user
      end
     end
    if user.has_role? :admin
      can :manage, :all
    end
  end
end

