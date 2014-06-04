# -*- encoding : utf-8 -*-
class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :trackable, :validatable, :timeoutable, authentication_keys: [:username]
  validates_presence_of :username
  validates_uniqueness_of :username, :matricula
  validate :external_user_needs
  validates :name, :format => {:with => /\A[a-zA-Z]+\z/, :message => "Caractere inválido"}
  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :encrypted_password, :remember_me,:name, :matricula, :external_user, :role_ids

  def external_user_needs

    self.matricula = matricula

    if external_user
      if self.name.blank?
        errors.add(:name, "não pode ficar em branco")
      end
      if  matricula.blank?
        errors.add(:matricula, "não pode ficar em branco")
      else
        # Test if the cpf is valid (just if has 11 numbers, and just numbers. No further validations are made.)
        if matricula.length != 11 or !Cpf.new(matricula).valido?
          errors.add(:matricula, "CPF inválido")
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

    self.username = username
    unless self.external_user
      self.matricula = Devise::LDAP::Adapter.get_ldap_param(username,"uid")[0]
      self.name = Devise::LDAP::Adapter.get_ldap_param(username,"givenName")[0]
      general_info = Devise::LDAP::Adapter.get_ldap_param(username,"dn")
      check = User.check_levels(general_info)

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
      else
        #nothing to do here
        return
      end
    end
  end


  def self.check_levels(general_info)
    if general_info.at("Professores") != nil
      return "Professores"
    elsif general_info.at("Servidores") != nil
      return "Servidores"
    elsif general_info.at("Alunos") != nil
      return "Alunos"
    end
  end


  def self.verify_user user
    if user.has_role? :student
      "Aluno"
    elsif user.has_role? :professor
      "Professor"
    elsif user.has_role? :administrative
      "Servidor Administrativo"
    elsif user.has_role? :external_user
      "Usuário Externo"
    end
  end


end
