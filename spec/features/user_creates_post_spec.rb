require 'rails_helper'

feature 'User creates post' do
	scenario "succussfully" do
		user = FactoryGirl.create(:user)
		login_as(user, :scope => :user)

		visit new_post_path
		fill_in "Title", with: "first post"
		fill_in "Url", with: "google.com"
		click_on "Submit"

		expect(page).to have_content 'first post'
	end
end