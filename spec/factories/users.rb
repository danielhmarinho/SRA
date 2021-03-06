# -*- encoding : utf-8 -*- 
FactoryGirl.define do

  factory :administrative, :class => User do
    username "132225"
    password "VGDC2225"
    after(:create) {|user| user.add_role(:administrative)}  
  end

  factory :manager, :class => User do
    username "100125271"
    password "TDSFR5271"
  after(:create) {|user| user.add_role(:manager)}
end


  factory :student, :class => User do
    username "100125271"
    password "TDSFR5271"
    after(:create) {|user| user.add_role(:student)}
  end

  factory :professor, :class => User do
    username "1069420"
    password "AMDAP9420"
    after(:create) {|user| user.add_role(:professor)}
  end

  factory :administrator, :class => User do
    username "120136198"
    password "TFB6198"
    after(:create) {|user| user.add_role(:admin)}
  end

  factory :administrator1, :class => User do
    username "110057872"
    password "ACB7872"
    after(:create) {|user| user.add_role(:admin)}
  end

   factory :external_user, :class => User do
    username "120136198"
    password "TFB6198"
    after(:create) {|user| user.add_role(:external_user)}
  end

end