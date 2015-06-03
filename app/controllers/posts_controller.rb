class PostsController < ApplicationController
	before_action :authenticate_user!, only: [:create, :upvote]
	def index
		@posts = Post.all
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

	def upvote
		@post = Post.find(params[:id])

		if @post.save
			@post.upvote_by current_user
			flash[:success] = "Upvoted"
		else
			flash[:error] = "Please Sign In"
		end
		redirect_to :back
	end

	private 

		def post_params
			params.require(:post).permit(:title, :url, :body)
		end
end
