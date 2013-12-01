class CommentsController < ApplicationController

  def create
    source = Source.find(params[:source_id])
    @comment = source.comments.build(comment_params)
    @comment.save
    redirect_to source_path(source)
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end