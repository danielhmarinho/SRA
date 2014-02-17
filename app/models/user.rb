class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :ldap_authenticatable, :trackable, :validatable, :timeoutable, :authentication_keys => [:username]

  validates_presence_of :username
  validates_uniqueness_of :username

  

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :password, :password_confirmation, :remember_me,:name, :matricula

  def email_required?
    false
  end

  def email_changed?
    false
  end

before_save :get_ldap_name

def get_ldap_name
  self.name = Devise::LDAP::Adapter.get_ldap_param(self.username,"givenName")[0]
  self.add_role :admin

end
end
