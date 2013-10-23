require 'test_helper'

class TipoAtendimentosControllerTest < ActionController::TestCase
  setup do
    @tipo_atendimento = tipo_atendimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tipo_atendimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tipo_atendimento" do
    assert_difference('TipoAtendimento.count') do
      post :create, tipo_atendimento: { nome: @tipo_atendimento.nome }
    end

    assert_redirected_to tipo_atendimento_path(assigns(:tipo_atendimento))
  end

  test "should show tipo_atendimento" do
    get :show, id: @tipo_atendimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tipo_atendimento
    assert_response :success
  end

  test "should update tipo_atendimento" do
    put :update, id: @tipo_atendimento, tipo_atendimento: { nome: @tipo_atendimento.nome }
    assert_redirected_to tipo_atendimento_path(assigns(:tipo_atendimento))
  end

  test "should destroy tipo_atendimento" do
    assert_difference('TipoAtendimento.count', -1) do
      delete :destroy, id: @tipo_atendimento
    end

    assert_redirected_to tipo_atendimentos_path
  end
end
