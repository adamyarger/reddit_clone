require 'rails_helper'

describe PostsController, type: :controller do
	
	describe 'POST #create' do
		context 'with valid attributes' do
			before(:each) do
				user = FactoryGirl.create :user
				sign_in user
			end

			it 'creates the post' do
				post :create, post: attributes_for(:post)
				expect(Post.count).to eq(1)
			end

			it 'redirects to the root page' do
				post :create, post: attributes_for(:post)
				expect(response).to redirect_to root_path
			end
		end

		context 'with invalid attributes' do
    	before(:each) do
				user = FactoryGirl.create :user
				sign_in user
			end

    	it 'does not create the post' do
    		post :create, post: attributes_for(:post, title: nil)
    		expect(Post.count).to eq(0)
    	end

    	it 're-renders the new view' do
    		post :create, post: attributes_for(:post, title: nil)
    		expect(response).to render_template :new
    	end
    end
	end

	describe 'GET #index' do
		before(:each) do
			4.times { FactoryGirl.create :post }
			get :index
		end

		it 'returns 4 records from the database' do
			expect(response).to render_template :index
		end
	end

end








