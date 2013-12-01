class CommentsController < ApplicationController

  def create
    # debugger
    source = Source.find(params[:source_id])
    @comment = source.comments.build(comment_params)
    if @comment.save
      p "YAY IT WORKED"
      render :json => render_to_string(:partial => 'new_comment', :locals => {:comment => @comment}).to_json
    else
      "FUCK, EVERYTHING IS FUCKED"
      flash[:error] = 'Comment could not be saved. Please try again.'
      redirect_to source_path(source)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end