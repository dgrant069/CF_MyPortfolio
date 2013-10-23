class CommentsController < ApplicationController
#before_filter :load_post

  def create

    @comment = Comment.new(params[:comment])
    @post = @comment.post

    if @comment.save
      flash[:notice] = "Comment awaiting moderation"
      redirect_to @post
    else
      @post = Post.find(@comment.post_id)
      render template: "posts/show"
    end
  end

  def update
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])

    @comment.destroy
    redirect_to post_path(@post)
  end

end
