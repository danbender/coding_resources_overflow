class CommentsController < ApplicationController

  def create
    source = Source.find(params[:source_id])
    @comment = source.comments.build(comment_params)
    if @comment.save
      render :json => render_to_string(:partial => 'new_comment', :locals => {:comment => @comment}).to_json
    else
      flash[:error] = 'Comment could not be saved. Please try again.'
      redirect_to source_path(source)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end