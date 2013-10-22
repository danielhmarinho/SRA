<img src="http://www.marca.unb.br/img/assinatura_neg/as_comp_neg.gif" />
#SRA - Sistema de Registro de Atendimento



Wiki do Projeto: https://github.com/gbrego/SRA/wiki


Pasta do Dropbox: https://www.dropbox.com/sh/ddhhvym6w6v6n4i/VWvNQVo53n



===
###Regras de boa convivência com a programação em equipes

1. Antes de Começar, verifique o estado do repositório local com 

		git status

2. Atualize a lista de branches com o repositório remoto

		git fetch --prune

		
3. Fazer uma branch para cada tarefa a ser desempenhada
		
		git checkout -b




4. Após o fim da tarefa 
     	
	    git commit

6. Escreva seu código Ruby em inglês.
7. Comente suas funções de maneira concisa, isto é, transmita a informação com o menor número de caracteres
8. Ruby utiliza o padrão de codificação underscore:

	```ruby
	require 'redcarpet'
	markdown = Redcarpet.new("Hello World!")
	puts markdown.to_html
	```


Após a abrir a tela de mensagem:

	Mensagem do Commit
	Signed-off-by: Nome Completo <email@email.com>
        
5. Esqueçeu alguma coisa no commit  e deseja modificar:
 

	    git commit --amend



===
##Usando o Git:
Este repositório pode ser baixado pelo comando:

	    git clone https://github.com/gbrego/SRA.git 

Atualizar a lista de branches:

	     git fetch --prune

Mudando de Branchs:
	 
	     git checkout <nome da branch>


Criando uma Branch:
         
         git checkout -b <nome da branch>
         

Adicionando arquivos a um commit:
         
         git add <nome do arquivo>

Adicionando todos os arquivos:
         
         git add .

Antes de commitar qualquer arquivo:
         
         git status

Commitando:
         
          git commit

Após a abrir a tela de mensagem:

        Mensagem do Commit
        Signed-off-by: Nome Completo <email@email.com>

Push do Commit para o Github:
        
         git push origin <branch>

Resetando o repositório para o estado do último commit :
        
         git reset --hard       

Outras dúvidas de Git:

<http://rogerdudler.github.io/git-guide/index.pt_BR.html>

===
##Usando o Rails:
