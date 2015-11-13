class CommentsController < ApplicationController
before_action :authenticate_user!

	# def index
	# 	@comments = Comment.all
	# end

	def show 
		@comment = Comment.find(params[:id])
	end

	def new 
		@comment = Comment.new
	end

	# def edit 
	# 	@post = Post.find(params[:id])
	# 	render 'edit'
	# end

	def create
		@post = Post.find(params[:post_id])
		@comment = Comment.create(comment_params)
		if @comment.save
			flash[:notice] = 'Comment successfully added.'
			redirect_to(@comment.post)
		else
			flash[:notice] = 'Error creating comment.'
			redirect_to(@comment.post)
		end
	end

	# def destroy
	# 	post = Post.find(params[:id])
	# 	post.destroy
	# 	redirect_to '/'
	# end

	private 
		def comment_params
			params.require(:comment).permit(:comment_body, :user_username)
		end
end
