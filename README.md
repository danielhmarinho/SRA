SRA
===

Sistema de Registro de Atendimento da Faculdade UnB Gama

<h2> Sobre </h2>

O projeto visa desenvolver um sistema para gerenciamento dos serviços acadêmicos prestados pelos funcionários da Universidade de Brasília - Campus FGA, com o foco em prover informações quantitativas a respeito da carga e categorias de trabalho dos servidores administrativos.

<h2> Dados Técnicos </h2>

<a href="https://travis-ci.org/gbrego/SRA"><img src="https://travis-ci.org/gbrego/SRA.png?branch=architecture"></a> <a href='https://coveralls.io/r/gbrego/SRA?branch=architecture'>[![Coverage Status](https://coveralls.io/repos/gbrego/SRA/badge.png?branch=architecture)](https://coveralls.io/r/gbrego/SRA?branch=architecture)[![Code Climate](https://codeclimate.com/github/gbrego/SRA.png)](https://codeclimate.com/github/gbrego/SRA)


```
Versão do Rails: 3.2.15 || Versão do Ruby: 1.9.3 
```

<h2> Equipe </h2>

- **[Alessandro Caetano](http://github.com/AlessandroCaetano)** - Engenharia de Software - UnB Gama
- **[Guilherme Baufaker](http://github.com/gbrego)**    - Engenharia de Software - UnB Gama
- **[Thaiane Ferreira](http://github.com/Thaiane)**     - Engenharia de Software - UnB Gama
- **[Thiago Souza Ribeiro](http://github.com/thiagovsk)**               - Engenharia de Software - UnB Gama
- **[Carlos Oliveira](http://github.com/carloshfoliveira)**     - Engenharia de Software - Unb Gama
- **[Hilmer Rodrigues Neri](http://github.com/hneri)**      - Professor Orientador   - UnB Gama


<h2> Executando a Aplicação </h2>

1.Primeiramente clone o repositório.

```
git clone https://github.com/gbrego/SRA.git
```

2.Entre na pasta do SRA.

```
cd SRA
```
3.Instale as gems e depêndencias da aplicação.

```
bundle install
```
4.Rode as migrações.

```
rake db:reset ou bundle exec rake db:reset
```
5.Execute a aplicação.

```
rails s
```
6.No navegador abra a página no endereço.

```
https://localhost:3000
```
