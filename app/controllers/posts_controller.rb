class PostsController < ApplicationController

before_action :authenticate_user!

	def index
		@posts = Post.paginate(:page => params[:page], :per_page => 2)
	end

	def show 
		@post = Post.find(params[:id])
		@comment = Comment.new( :post => @post)
	end

	def new 
		@post = Post.new
	end

	# def edit 
	# 	@post = Post.find(params[:id])
	# 	render 'edit'
	# end

	def create
		@post = Post.create(post_params)
		redirect_to "/"
	end

	# def update
	# 	post = Post.find(params[:id])
	# 	if post.valid?
	# 		post.update_attributes(post_params)
	# 		redirect_to '/'
	# 	else
	# 		flash[:error] = "Post not saved. Fill out all fields."
	# 		render 'edit'
	# 	end
	# end

	# def destroy
	# 	post = Post.find(params[:id])
	# 	post.destroy
	# 	redirect_to '/'
	# end

	private 
		def post_params
			params.require(:post).permit(:post_title, :post_body, :post_image)
		end
end