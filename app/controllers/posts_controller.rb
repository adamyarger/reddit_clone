class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create]
	def index
		
	end

	def create
		@post = current_user.posts.build(post_params)

		if @post.save
			redirect_to root_path
		else
			render :new
		end
	end

	def new
		@post = Post.new
	end

	private 

		def post_params
			params.require(:post).permit(:title, :url, :body)
		end
end
