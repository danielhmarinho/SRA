# -*- encoding : utf-8 -*-
require 'test_helper'

class ProfessorsControllerTest < ActionController::TestCase
  setup do
    @professor = Professor.create name: "Hilmer", matricula: "21121"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:professors)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create professor" do
    assert_difference('Professor.count') do
      post :create, professor: {  }
    end

  assert_redirected_to professors_path
  end

  test "should show professor" do
    get :show, id: @professor
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @professor
    assert_response :success
  end

  test "should update professor" do
    put :update, id: @professor, professor: {  }
      assert_redirected_to professors_path
  end

  test "should destroy professor" do
    assert_difference('Professor.count', -1) do
      delete :destroy, id: @professor
    end

    assert_redirected_to professors_path
  end
end
