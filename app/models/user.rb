class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :trackable, :validatable, :timeoutable, :authentication_keys => [:username]

  validates_presence_of :username
  validates_uniqueness_of :username

  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me,:name, :matricula, :type

  def email_required?
    false
  end

  def email_changed?
    false
  end

before_save :get_ldap_name


def get_ldap_name
  self.matricula = Devise::LDAP::Adapter.get_ldap_param(self.username,"uid")[0]
  self.name = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenName")[0]

  general_info = Devise::LDAP::Adapter.get_ldap_param(self.username,"dn")


  case check_levels(general_info)

    when "Alunos"
      return self.add_role :student

    when "Professores"
      return self.add_role :professor

    when "Servidores"
      return self.add_role :administrative


  end

  #self.add_role :admin
end


  def check_levels(general_info)

    if general_info.at("Professores") != nil
      return "Professores"

    elsif general_info.at("Servidores") != nil
      return "Servidores"

    elsif general_info.at("Alunos") != nil
      return "Alunos"
    end

  end


end
