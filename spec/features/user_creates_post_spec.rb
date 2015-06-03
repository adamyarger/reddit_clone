require 'rails_helper'

feature 'User creates post' do
	scenario "succussfully" do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		create_post 'first post'

		expect(page).to have_content 'first post'
	end
end