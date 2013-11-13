# -*- encoding : utf-8 -*-
require 'test_helper'

class AlunosControllerTest < ActionController::TestCase
  setup do
    @aluno = Aluno.create name: "Guilherme", matricula: "29291201"
 
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:alunos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create aluno" do
    assert_difference('Aluno.count') do
      post :create, aluno: { matricula: "2323", name: @aluno.name }
    end

    assert_redirected_to alunos_path
  end

  test "should show aluno" do
    get :show, id: @aluno
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @aluno
    assert_response :success
  end

  test "should update aluno" do
    put :update, id: @aluno, aluno: { matricula: @aluno.matricula }
  end

  test "should destroy aluno" do
    assert_difference('Aluno.count', -1) do
      delete :destroy, id: @aluno
    end
  end
end
