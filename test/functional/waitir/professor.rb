# iniciando o watir
require 'watir-webdriver' 

#Cadastrar, alterar e excluir Professor
browser = Watir::Browser.start "http://localhost:3000/professors"
browser.link(:text, "Criar Professor").click
browser.text_field(:id, "professor_name").set("Hilmer")
browser.text_field(:id, "professor_matricula").set("5647")
browser.button(:value,"Criar Professor").click
browser.link(:text, "Editar").click
browser.text_field(:id, "professor_name").set("Hilmer Neri")
browser.button(:value,"Atualizar Professor").click
browser.link(:text, "Deletar").click
