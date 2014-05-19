# -*- encoding : utf-8 -*-
 
require 'spec_helper'

describe UsersController do

		login_admin
 
		let(:invalid_attributes) { { name: "Nome", matricula: "123abc", username: "externo", password: "13123", external_user: true } }
		
		let(:valid_attributes) { { name: "Usuario Externo", matricula: "25391659310", username: "externo1", password: "12345",
external_user: true } }
 
	describe "GET new" do
		it "assigns a new user as @user" do
			get :new, {}
			expect(assigns(:user)).to be_a_new(User)
		end
	end

	describe "POST create" do
		
		describe "with valid params" do
			it "creates a new User" do
			expect {
			post :create, {:user => valid_attributes}
			}.to change(User, :count).by 1
		end
		 
		it "assigns a newly created user as @user" do
			post :create, {:user => valid_attributes}
			expect(assigns(:user)).to be_a User
			expect(assigns(:user)).to be_persisted
		end
		 
		it "redirects to the login page" do
			post :create, {:user => valid_attributes}
			expect(response).to redirect_to root_path
			end
		end
		 
		describe "with invalid params" do
		 
		it "does not creates a new User" do
			expect{post :create, {:user => valid_attributes}}.to change(User, :count).by 1
		end
		 
		it "assigns a newly created but unsaved user as @user" do
		# Trigger the behavior that occurs when invalid params are submitted
			User.any_instance.stub(:save).and_return(false)
			post :create, {:user => invalid_attributes}
			expect(assigns(:user)).to be_a_new(User)
		end
		 
		it "re-renders the 'new' template" do
		# Trigger the behavior that occurs when invalid params are submitted
			User.any_instance.stub(:save).and_return(false)
			post :create, {:user => invalid_attributes}
			expect(response).to render_template("new")
		end
	end
end



  describe "GET index" do
    it "assigns all users as @users" do
      get :index, {}
      expect(assigns(:user)).to be_a_new(User)
    end    
  end

  describe "GET edit" do
    it "assigns the requested user as @user" do
      user = User.create! valid_attributes
      get :edit, {:id => user.to_param}
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
        expect_any_instance_of(User).to receive(:update_attributes).with( valid_attributes )
        put :update, {:id => user.to_param, :user =>  valid_attributes }
      end

      it "assigns the requested user as @user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(assigns(:user)).to eq(user)
      end

      it "redirects to the user" do
        user = User.create! valid_attributes
        put :update, {:id => user.to_param, :user => valid_attributes}
        expect(response).to redirect_to root_path
      end
    end

    describe "with invalid params" do
      it "assigns the user as @user" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(User).to receive(:save).and_return(false)
        put :update, {:id => @user.to_param, :user => invalid_attributes }
        expect(response).to redirect_to users_path
      end

      it "re-renders the 'edit' template" do
        user = User.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        allow_any_instance_of(User).to receive(:save).and_return(false)
        put :update, {:id => user.to_param, :user => invalid_attributes }
        expect(response).to render_template("edit")
      end
    end
  end

end
