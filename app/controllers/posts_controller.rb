class PostsController < ApplicationController
    def show
        @post = Post.find(params[:id])
        if user_signed_in?
          @message_has_been_sent = conversation_exist?
        end
    end

    def hobby
        posts_for_branch(params[:action])
    end

    def study
        posts_for_branch(params[:action])
    end

    def team
        posts_for_branch(params[:action])
    end

    private

    def posts_for_branch(branch)
        @categories = Category.where(branch: branch)
        @posts = get_posts.paginate(page: params[:page])
    end

    def get_posts
      Post.limit(30)
    end

    def conversation_exist?
      Private::Conversation.between_users(current_user.id, @post.user.id).present?
    end
end
