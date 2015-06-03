require 'rails_helper'

feature 'User votes post' do
	scenario 'successfully' do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		visit root_path

		create_post 'first post'
		visit root_path
		expect(page.current_path).to eq root_path

		find('.up').click

		expect(page).to have_content '1 points'
	end
end