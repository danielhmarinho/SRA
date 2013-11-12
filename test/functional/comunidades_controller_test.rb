# -*- encoding : utf-8 -*-
require 'test_helper'

class ComunidadesControllerTest < ActionController::TestCase
  setup do
    @comunidade = Comunidades.create name: "Pessoa Externa", identificacao: "023.832.393-23" 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:comunidades)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create comunidade" do
    assert_difference('Comunidade.count') do
      post :create, comunidade: {  }
    end

    assert_redirected_to comunidades_path
  end

  test "should show comunidade" do
    get :show, id: @comunidade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @comunidade
    assert_response :success
  end

  test "should update comunidade" do
    put :update, id: @comunidade, comunidade: {  }
    assert_redirected_to comunidades_path
  end

  test "should destroy comunidade" do
    assert_difference('Comunidade.count', -1) do
      delete :destroy, id: @comunidade
    end

    assert_redirected_to comunidades_path
  end
end
