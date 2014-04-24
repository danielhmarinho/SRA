# encoding: UTF-8


Type.create!([

        {name: "Outros"}


    ])

Place.create!([
                  {name: "Secretaria de Graduação", :types => Type.where("name in ('Outros')")},
                  {name: "Secretaria da Direção", :types => Type.where("name in ('Outros')")},
                  {name: "Biblioteca", :types => Type.where("name in ('Outros')")}

              ])


Type.create!([
                 #Tipos de Atendimento referentes apenas a Secretaria de Graduação

                 {name: "Solicitação de Equipamento", :places => Place.where("name in ('Secretaria de Graduação')")},
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


                 #Tipos referentes à Secretaria da Direção

                 {name: "Agendar Reunião", :places => Place.where("name in ('Secretaria da Direção')")},
                 {name: "Entregar Documentos Diversos", :places => Place.where("name in ('Secretaria da Direção')")},
                 {name: "Buscar Documentos Diversos", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Logística de Realização",:places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Pedido de Informação", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Assinatura de Documentos", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Pesquisa no SIGRA", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Pesquisa no UNBDOC", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Realizar Ligação", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Reserva de Sala", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Solicitação de Material", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Solicitar Atendimento do prof. Coordenador Geral", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Solicitar Atendimento do prof. Diretor", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Solicitar Atendimento do prof. Vice-Diretor", :places =>Place.where("name in ('Secretaria da Direção')")},
                 {name: "Solicitar Impressão", :places => Place.where("name in ('Secretaria da Direção')")},
                 {name: "Solicitar Formulários", :places => Place.where("name in ('Secretaria da Direção')")},
                 {name: "Solicitar Xerox", :places => Place.where("name in ('Secretaria da Direção')")},

                 #Tipos referentes à Biblioteca

                 {name: "Empréstimo de Materiais Bibliográficos", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Renovação de Materiais Bibliográficos", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Devolução de Materiais Bibliográficos", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Reserva de Materiais Bibliográficos", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Renovação de Cadastro de Usuários", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Emissão de Multa", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Emissão de Nada Consta", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Pagamento de Multa", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Resolução de Pendências de Usuários", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Solicitação de Pedidos do COMUT", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Publicidade de Novas Aquisições", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Guarda de materiais perdidos", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Auxílio em pesquisas em bases de dados e bibliotecas digitais", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Realização de pesquisas no catálogo online", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Emissão de etiquetas, carimbagem, papeletas e fitas magnéticas para materiais bibliográficos", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Empréstimo de computadores", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Auxílio estante", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Prestação de informações de interesse aos usuários e visitantes", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Verificação de sugestões e pedidos de materiais bibliográficos para aquisição", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Recebimento e seleção de doações", :places => Place.where("name in ('Biblioteca')")},
                 {name: "Envio de relatórios de materiais bibliográficos", :places => Place.where("name in ('Biblioteca')")},


                 #Referente as Secretarias de Graduação e Direção

                 {name: "Declaração", :places => Place.find(1,2)},


                 #Tipo de atendimento de outros

                 #{name: "Outros", :places => Place.find(1,2,3)}
             ])



