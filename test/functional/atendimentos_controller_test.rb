# -*- encoding : utf-8 -*-
require 'test_helper'

class AtendimentosControllerTest < ActionController::TestCase
  setup do
     @professor = Professor.create name: "Hilmer", matricula: "21121"
     @place = Place.create name:"Bibiblioteca"
     @type = Type.create name: "Documentação", place_id: @place.id
     @atendimento = Atendimento.create pessoa_id: @professor.id, data: "2013-11-12 13:46:00", 
     place_id: @place.id, type_id: @type.id
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:atendimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create atendimento" do
    assert_difference('Atendimento.count') do
    end
        post :create, atendimento: {data: @atendimento.data, place: @place}

    assert_redirected_to atendimento_path(assigns(:atendimento))
  end

  test "should show atendimento" do
    get :show, id: @atendimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @atendimento
    assert_response :success
  end

  test "should update atendimento" do
    put :update, id: @atendimento, atendimento: { data: @atendimento.data }
    assert_redirected_to atendimentos_path
  end

  test "should destroy atendimento" do
    assert_difference('Atendimento.count', -1) do
      delete :destroy, id: @atendimento
    end

    assert_redirected_to atendimentos_path
  end
end
