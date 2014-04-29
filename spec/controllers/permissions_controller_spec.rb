# -*- encoding : utf-8 -*-
require 'spec_helper'

describe PermissionsController do

  login_admin

  # This should return the minimal set of attributes required to create a valid
  # User. As you add validations to User, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { :name => "Usuario" , :username => "100125271" , :password => "123456" , :matricula => "100000"} }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # UsersController. Be sure to keep this updated too.

  describe "POST edit" do
    it "assigns the requested user user" do
      user = User.create! valid_attributes
      post :edit, {:id => user.to_param}
      expect(assigns(:user)).to eq(user)
    end
  end

 describe "PUT update" do
    describe "with valid params" do
      it "updates the requested user" do
        user = User.create! valid_attributes
        # Assuming there are no other users in the database, this
        # specifies that the User created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        expect_any_instance_of(User).to receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => user.to_param, :user => { "these" => "params" }}
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {  }}
        expect(assigns(:user)).to eq(user)
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        User.any_instance.stub(:save).and_return(false)
        put :update, {:id => user.to_param, :user => {  }}
        expect(response).to render_template("edit")
      end
    end
  end

end
