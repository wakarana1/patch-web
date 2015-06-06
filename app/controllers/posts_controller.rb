class PostsController < ApplicationController
	def index
		@posts = Post.all.order("id DESC").all
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
		@comment = Comment.new
		if params[:commit] == "Next"
	       post = Post.find(params[:id].to_i + 1)
	       redirect_to post_path(post)
	   elsif params[:commit] == "Prev"
	       post = Post.find(params[:id].to_i - 1)
	       redirect_to post_path(post)
	   else
	    	@post = Post.find(params[:id])
	   end	
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

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path
	end
private
    def post_params
        params.require(:post).permit(:title,:body,:user_id)
    end
end
