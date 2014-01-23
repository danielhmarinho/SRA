# Exemplo de uso do Watir
# Objetivo: Executar as seguintes tarefas:
#  * inserir um texto no campo de buscas
#  * clicar no botão
#  * verificar se o resultado confere
# O teste irá buscar pelo nosso site (ruby-br)

# iniciando o watir
require 'watir-webdriver' 

#Criar local de atendimento, alterar e excluir
browser = Watir::Browser.start "http://localhost:3000/"
browser.link(:text, "Locais de Atendimento").click
browser.link(:text, "Criar Local de Atendimento").click
browser.text_field(:id, "place_name").set("Laboratorio")
browser.button(:value,"Criar Local de Atendimento").click
browser.link(:text, "Editar").click
browser.text_field(:id, "place_name").set("Laboratório")
browser.button(:value,"Atualizar Atendimento").click
browser.link(:text, "Deletar").click
#browser.link(:text,"OK").click
