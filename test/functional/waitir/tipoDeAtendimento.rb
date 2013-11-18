# iniciando o watir
require 'watir-webdriver' 

#Criar, editar e excluir tipo de atendimento

browser = Watir::Browser.start "http://localhost:3000/atendimentos"
browser.link(:text, "Tipos de Atendimento").click
browser.link(:text, "Criar Tipo de Atendimento").click
browser.text_field(:id, "type_name").set("Alugar Laboratorio")
browser.button(:value,"Criar Tipo de Atendimento").click
browser.link(:text, "Editar").click
browser.text_field(:id, "type_name").set("Alugar Laboratorioss")
browser.button(:value,"Atualizar Tipo de Atendimento").click
browser.link(:text, "Deletar").click