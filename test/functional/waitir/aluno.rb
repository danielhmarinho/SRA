# iniciando o watir
# -*- encoding : utf-8 -*-

require 'watir-webdriver' 

#Cadastrar aluno
#browser = Watir::Browser.start "http://localhost:3000"


browser = Watir::Browser.new
browser.goto "http://localhost:3000"

browser.link(:text, "Ainda não tem cadastro?").click
browser.text_field(:id, "aluno_name").set("Thaiane")
browser.text_field(:id, "aluno_matricula").set("120136198")
browser.text_field(:id, "aluno_username").set("thaiane")
browser.text_field(:id, "aluno_password").set("123456")
browser.text_field(:id, "aluno_password_confirmation").set("123456")
browser.button(:value,"Criar Aluno").click


browser.goto "http://localhost:3000"


# Cadastrar usuário já existente
browser.link(:text, "Ainda não tem cadastro?").click
browser.text_field(:id, "aluno_name").set("thaiane")
browser.text_field(:id, "aluno_matricula").set("120136198")
browser.text_field(:id, "aluno_username").set("thaiane")
browser.text_field(:id, "aluno_name").set("Thaiane")
browser.text_field(:id, "aluno_password").set("123456")
browser.text_field(:id, "aluno_password_confirmation").set("123456")
browser.button(:value,"Criar Aluno").click

browser.goto "http://localhost:3000"


# Senha inválida
browser.text_field(:id, "user_username").set("thaiane")
browser.text_field(:id, "user_password").set("12345")
browser.button(:value,"Login").click

# Login inválido
browser.text_field(:id, "user_username").set("thaian")
browser.text_field(:id, "user_password").set("123456")
browser.button(:value,"Login").click



# Realizar atendimento
browser.text_field(:id, "user_username").set("thaiane")
browser.text_field(:id, "user_password").set("123456")
browser.button(:value,"Login").click
browser.select_list(:id, "atendimento_place_id").select("Secretaria da Direção")
browser.select_list(:id, "atendimento_type_id").select("Declaração")
browser.button(:value,"Criar Atendimento").click
browser.link(:text, "Sair").click


browser = Watir::Browser.start "http://localhost:3000"