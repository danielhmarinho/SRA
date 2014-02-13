# Read about factories at https://github.com/thoughtbot/factory_girl
 
FactoryGirl.define do
  factory :user do |f|
    f.name "Alessandro"
    f.username "alessandrocb"
    f.matricula "123456789"
    f.password "123456789"
    f.password_confirmation "123456789"
    f.after(:create) {|user| user.add_role(:student)}
  end
  
  
 
  
end