require 'test_helper'

class LocalAtendimentosControllerTest < ActionController::TestCase
  setup do
    @local_atendimento = local_atendimentos(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:local_atendimentos)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create local_atendimento" do
    assert_difference('LocalAtendimento.count') do
      post :create, local_atendimento: { nome: @local_atendimento.nome }
    end

    assert_redirected_to local_atendimento_path(assigns(:local_atendimento))
  end

  test "should show local_atendimento" do
    get :show, id: @local_atendimento
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @local_atendimento
    assert_response :success
  end

  test "should update local_atendimento" do
    put :update, id: @local_atendimento, local_atendimento: { nome: @local_atendimento.nome }
    assert_redirected_to local_atendimento_path(assigns(:local_atendimento))
  end

  test "should destroy local_atendimento" do
    assert_difference('LocalAtendimento.count', -1) do
      delete :destroy, id: @local_atendimento
    end

    assert_redirected_to local_atendimentos_path
  end
end
