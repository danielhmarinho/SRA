# iniciando o watir
require 'watir-webdriver' 

#Cadastrar aluno
#browser = Watir::Browser.start "http://localhost:3000"

#registro de aluno com sucesso
browser = Watir::Browser.new
browser.goto "http://localhost:3000"


browser.link(:text, "Ainda não tem cadastro?").click
browser.text_field(:id, "aluno_name").set("thiago")
browser.text_field(:id, "aluno_matricula").set("100125271")
browser.text_field(:id, "aluno_username").set("thiago")
browser.text_field(:id, "aluno_password").set("12345678")
browser.text_field(:id, "aluno_password_confirmation").set("12345678")
browser.button(:id,"cadastrar-aluno").click

browser.goto "http://localhost:3000"


# Cadastrar usuário já existente

browser.text_field(:id, "aluno_name").set("thiago")
browser.text_field(:id, "aluno_matricula").set("100125271")
browser.text_field(:id, "aluno_username").set("thiago")
browser.text_field(:id, "aluno_password").set("12345678")
browser.text_field(:id, "aluno_password_confirmation").set("12345678")
browser.button(:id,"cadastrar-aluno").click


# Senha inválida
browser.text_field(:id, "user_username").set("thiagovsk")
browser.text_field(:id, "user_password").set("1010101010")
browser.button(:value,"Login ").click

# Login inválido



# Realizar atendimento

browser = Watir::Browser.start "http://localhost:3000"