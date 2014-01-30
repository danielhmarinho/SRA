# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :aluno do |f|
    f.name "Alessandro"
    f.username "alessandrocb"
    f.matricula "123456789"
    f.password "123456789"
    f.password_confirmation "123456789"
    f.as_user_type "Aluno"
  end
end
