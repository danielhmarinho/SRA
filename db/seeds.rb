# encoding: UTF-8
Place.create!([
	{name: "Secretaria de Graduação"},
	{name: "Secrataria da Direção"}
])
Type.create!([

     {name: "Solicitação de Equipamento", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Declaração",:places => Place.where("name in ('Secretaria de Graduação', 'Secretaria da Direção')")},
		 {name: "Revisão de Menção", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Compravante de Matrícula", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Lista de Presença", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Afastamento", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Documentação", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Material Escritório", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Viagens", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Diárias", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Passagens", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Prestação de Contas", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Inscrições", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Crachá", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Concursos", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Recursos", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Aproveitamento de Estudos", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Ementa", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Lista de Ofertas", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Carimbar Documentos", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Processos", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Frequência", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Marcação de Férias", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Atendimento Telefônico", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Impressão de Provas", :places => Place.where("name in ('Secretaria de Graduação')")},
		 {name: "Encadernação", :places => Place.where("name in ('Secretaria de Graduação')")},
])
