class CommentsController < ApplicationController
#before_filter :load_post

  def create

    @comment = Comment.new(params[:comment])
    @post = Post.find(@comment.post_id)

    if @comment.save
      flash[:notice] = "Comment awaiting moderation"
      redirect_to @post
    else

    end

  end

  # def destroy
  #   @post = Post.find(params[:post_id])
  #   @comment = @post.comments.find(params[:id])
  #   @comment.destroy
  #   redirect_to post_path(@post)
  #end

end
