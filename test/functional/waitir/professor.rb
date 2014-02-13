# iniciando o watir

require 'watir-webdriver' 

#Cadastrar atendimento


browser = Watir::Browser.new
browser.goto "http://localhost:3000"

browser.text_field(:id, "user_username").set("alessandro")
browser.text_field(:id, "user_password").set("NA2U9+m6")
browser.button(:id,"login").click
browser.link(:text, "Criar Atendimento").click
browser.select_list(:id, "atendimento_place_id").select("Biblioteca")
browser.select_list(:id, "atendimento_type_id").select("Pagamento de Multa")
browser.button(:id,"criar-atendimento").click
browser.link(:text, "Voltar").click

#criar professor
browser.goto "http://localhost:3000/professors"
browser.link(:text, "Criar Professor").click
browser.text_field(:id, "professor_name").set("hilmer")
browser.text_field(:id, "professor_matricula").set("5647")
browser.text_field(:id, "professor_username").set("hilmer.neri")
browser.text_field(:id, "professor_password").set("12345678")
browser.text_field(:id, "professor_password_confirmation").set("12345678")
browser.button(:id,"cadastrar-professor").click

#criar servidor

browser.goto "http://localhost:3000/servidors"
browser.link(:text, "Criar Servidor Administrativo").click
browser.text_field(:id, "servidor_name").set("thais")
browser.text_field(:id, "servidor_matricula").set("1010101010")
browser.text_field(:id, "servidor_username").set("thais")
browser.text_field(:id, "servidor_password").set("10101010")
browser.text_field(:id, "servidor_password_confirmation").set("10101010")
browser.button(:id,"cadastrar-servidor").click

browser.link(:id, "logout").click

browser = Watir::Browser.start "http://localhost:3000"