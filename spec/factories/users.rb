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
  factory :professor do |f|
    f.name "Joao"
    f.username "joaoabc"
    f.matricula "123456789"
    f.password "123456789"
    f.password_confirmation "123456789"
    f.as_user_type "Professor"
  end
  factory :servidor do |f|
    f.name "Maria"
    f.username "Mariaabc"
    f.matricula "123456789"
    f.password "123456789"
    f.password_confirmation "123456789"
    f.as_user_type "Servidor"
  end

end
