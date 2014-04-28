# -*- encoding : utf-8 -*-

require 'spec_helper'

describe UsersController do

	login_admin

	let(:invalid_attributes) { { name: "", matricula: "123abc", username: "externo", 
											password: "13123", external_user: true } }
	let(:valid_attributes) { { name: "Usuário Externo", matricula: "12312312312", username: "externo", 
												password: "13123", external_user: true } }

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
			    expect {
			      post :create, {:user => invalid_attributes}
			    }.not_to change(User, :count).by 1
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

	
end