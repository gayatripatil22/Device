class PostsController < ApplicationController
    def index
       @posts = policy_scope(Post).order(created_at: :desc)
    
    end
    def show
        @post = Post.find(params[:id])  
    end
    def new
        @post = Post.new
        authorize @post
    end
    def create
        @post = Post.new(post_params)
        authorize @post
        if @post.save
          redirect_to posts_path, status: :see_other
        else
          render :new, status: :unprocessable_entity
        end
        
    end

    def destroy
        @post=Post.find(params[:id])
        authorize @post
        @post.destroy
        redirect_to root_path, status: :see_other
    end
     
    def post_params
        params.require(:post).permit(:title, :content)
    end
end
