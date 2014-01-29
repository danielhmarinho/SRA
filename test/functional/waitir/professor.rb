# iniciando o watir
require 'watir-webdriver' 

#Cadastrar, alterar e excluir Professor
browser = Watir::Browser.start "http://localhost:3000/professors"
#Criação de Professor
browser.text_field(:id, "user_username").set("thaiane")
browser.text_field(:id, "user_password").set("123456")
browser.button(:value,"Login").click

browser.goto "http://localhost:3000/professors/new"

browser.text_field(:id, "professor_name").set("Hilmer Neri")
browser.text_field(:id, "professor_matricula").set("5647")
browser.text_field(:id, "professor_username").set("hilmer.neri")
browser.text_field(:id, "professor_password").set("123456")
browser.text_field(:id, "professor_password_confirmation").set("123456")
browser.button(:value,"Criar Professor").click
