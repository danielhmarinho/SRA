# Exemplo de uso do Watir
# Objetivo: Executar as seguintes tarefas:
#  * inserir um texto no campo de buscas
#  * clicar no botão
#  * verificar se o resultado confere
# O teste irá buscar pelo nosso site (ruby-br)

# iniciando o watir
require 'watir-webdriver' 
# definindo o site na variável
browser = Watir::Browser.start "http://localhost:3000/places"
browser.link(:text, "Criar Local de Atendimento").click
browser.text_field(:id, "place_name").set("CPD")
browser.button(:value,"Criar Local de Atendimento").click
