# iniciando o watir
require 'watir-webdriver' 

#Criar local de atendimento
browser = Watir::Browser.new
browser.goto "http://localhost:3000"

browser.text_field(:id, "user_username").set("thais")
browser.text_field(:id, "user_password").set("10101010")
browser.button(:id,"login").click
browser.goto "http://localhost:3000/places"
browser.link(:text, "Criar Local de Atendimento").click
browser.text_field(:id, "place_name").set("Local teste")
browser.button(:id,"criar-local").click

#Editar local de atendimento
browser.link(:text, "Editar").click
browser.text_field(:id, "place_name").set("Local teste Editado")
browser.button(:id,"atualizar-local").click

#Criar tipo de atendimento
browser.goto "http://localhost:3000/types"
browser.link(:text, "Criar Tipo de Atendimento").click
browser.text_field(:id, "type_name").set("Tipo teste")
browser.button(:id,"criar-tipo").click

#Editar tipo de atendimento
browser.link(:text, "Editar").click
browser.text_field(:id, "type_name").set("Tipo teste Editado")
browser.button(:id,"atualizar-tipo").click
browser.link(:id, "logout").click

browser = Watir::Browser.start "http://localhost:3000"