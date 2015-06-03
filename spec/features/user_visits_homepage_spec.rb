require 'rails_helper'

feature 'User visits gomepage' do
	scenario 'successfully' do
		visit root_path

		expect(page).to have_css 'h1', text: 'hello'
	end
end