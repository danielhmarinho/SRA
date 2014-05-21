# -*- encoding : utf-8 -*-

class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :trackable, :validatable, :timeoutable, :authentication_keys => [:username]

  validates_presence_of :username
  validates_uniqueness_of :username, :matricula
  validate :external_user_needs
  
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :encrypted_password, :remember_me,:name, :matricula, :external_user, :role_ids

  def external_user_needs
    if external_user
      if self.name.nil? or self.name.blank?
        errors.add(:name, "não pode ficar em branco")
      end

      if self.matricula.nil? or self.matricula.blank?
        errors.add(:matricula, "não pode ficar em branco")
      else
        # Test if the cpf is valid (just if has 11 numbers, and just numbers. No further validations are made.)
        if self.matricula.length != 11 or !Cpf.new(self.matricula).valido?
          errors.add(:matricula, "cpf inválido")
        end
      end  
    end
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end

  before_save :get_ldap_name

  def get_ldap_name
    unless self.external_user
      self.matricula = Devise::LDAP::Adapter.get_ldap_param(self.username,"uid")[0]
      self.name = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenName")[0]

      general_info = Devise::LDAP::Adapter.get_ldap_param(self.username,"dn")

      check = check_levels(general_info)

      case check
        when "Alunos"
          self.add_role :student 
	  Role.find_by_name("student").update_attribute(:display_name, "Aluno")
	  return

        when "Professores"
          self.add_role :professor
	  Role.find_by_name("professor").update_attribute(:display_name, "Professor")
	  return

        when "Servidores"
          self.add_role :administrative
          Role.find_by_name("administrative").update_attribute(:display_name, "Servidor Administrativo")
          return
        end
    end
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
