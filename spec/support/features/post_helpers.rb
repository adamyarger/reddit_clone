module Features
	def create_post(post_title)
		visit new_post_path
		fill_in "Title", with: "first post"
		fill_in "Url", with: "google.com"
		click_on "Submit"
	end
end