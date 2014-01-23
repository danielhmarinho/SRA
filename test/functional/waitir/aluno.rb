# iniciando o watir
require 'watir-webdriver' 

#Cadastrar, alterar e excluir Aluno
browser = Watir::Browser.start "http://localhost:3000/alunos"
browser.link(:text, "Criar Aluno").click
browser.text_field(:id, "aluno_name").set("Jessica")
browser.text_field(:id, "aluno_matricula").set("110014065")
browser.button(:value,"Criar Aluno").click
browser.link(:text, "Editar").click
browser.text_field(:id, "aluno_name").set("Jessica Suzuki")
browser.button(:value,"Atualizar Aluno").click
browser.link(:text, "Deletar").click