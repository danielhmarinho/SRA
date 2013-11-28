# iniciando o watir
require 'watir-webdriver' 

#Cadastrar, alterar e excluir Servidor Administrativo
browser = Watir::Browser.start "http://localhost:3000/servidors"
browser.link(:text, "Criar Servidor UnB").click
browser.text_field(:id, "servidor_name").set("Ana")
browser.text_field(:id, "servidor_matricula").set("1234")
browser.button(:value,"Criar Servidor UnB").click
browser.link(:text, "Editar").click
browser.text_field(:id, "servidor_name").set("Ana Paula")
browser.button(:value,"Atualizar Servidor").click
browser.link(:text, "Deletar").click