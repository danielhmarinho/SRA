# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $('#places').dataTable
    sPaginationType: "bootstrap"
    aLengthMenu: [ 10, 30, 50, 100 ],
    iDisplayLength: 10
    bScrollCollapse: true
    oLanguage:
      sInfo: "Exibindo _START_ à _END_ de _TOTAL_ registros"
      sInfoEmpty: "Exibindo 0 à 0 de 0 entradas"
      sInfoFiltered: "(filtrado de um total de _MAX_ registros)"
      sLengthMenu: "Exibir _MENU_ registros por página"
      sLoadingRecords: "Carregando..."
      sProcessing: "Processando..."
      sSearch: "Buscar:"
      sZeroRecords: "Não foi encontrado nenhum resultado para sua busca."
      oPaginate:
        sFirst: "Início"
        sNext: "Próximo"
        sLast: "Final"
        sPrevious: "Anterior"
        sEmptyTable: "Nenhum dado disponível na tabela"

  $('#types2').dataTable

    sPaginationType: "bootstrap"
    aLengthMenu: [ 10, 30, 50, 100 ],
    iDisplayLength: 10
    bScrollCollapse: true
    bDestroy: true
    oLanguage:
      sInfo: "Exibindo _START_ à _END_ de _TOTAL_ de tipos de atendimentos"
      sInfoEmpty: "Exibindo 0 à 0 de 0 entradas"
      sInfoFiltered: "(filtrado de um total de _MAX_ tipos de atendimentos)"
      sLengthMenu: "Exibir _MENU_ registros por página"
      sLoadingRecords: "Carregando..."
      sProcessing: "Processando..."
      sSearch: "Buscar:"
      sZeroRecords: "Tipo de atendimento não encontrado. <a href='/types/new'>Deseja criar este tipo de atendimento?</a>"
      oPaginate:
        sFirst: "Início"
        sNext: "Próximo"
        sLast: "Final"
        sPrevious: "Anterior"
        sEmptyTable: "Nenhum dado disponível na tabela"




