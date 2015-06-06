class PostsController < ApplicationController
	def index
		if params[:query]
			post_list = Post.all
			@posts = []
			post_list.each do |post|
				if post.title.downcase.include? params[:query].downcase
					@posts << post
				elsif post.body.downcase.include? params[:query].downcase
					@posts << post
				end
			end
		else
			@posts = Post.page(params[:page]).per(4).padding(0).all.order("id DESC").all
		end
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
	end

	def edit
  		@post = Post.find(params[:id])
	end

	def update
	  @post = Post.find(params[:id])

	  if @post.update_attributes(params.require(:post).permit(:title,:body))
	    redirect_to post_path
	  else
	    redirect_to edit_post_path
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
