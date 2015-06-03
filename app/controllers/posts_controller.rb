class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def new
		@post = Post.new		
	end
	def create
		post = Post.new(post_params)
		if post.valid?
			current_user.posts.push post
			current_user.save
			redirect_to posts_path
		else
			alert("Sorry, your post was not created")
			redirect_to new_post_path
		end
	end
	def show
		@post = Post.find(params[:id])		
	end
	def edit
  		@post = Post.find(params[:id])
	end
	def update
	  @post = Post.find(params[:id])

	  if @post.update_attributes(params.require(:post).permit(:title,:body))
	    redirect_to posts_path
	  else
	    render :edit
	  end
	end
private
    def post_params
        params.require(:post).permit(:title,:body,:user_id)
    end
end
