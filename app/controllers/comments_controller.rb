class CommentsController < ApplicationController

  def create
    @comment = Comment.new
    if @comment.update(comment_params)
      ActionCable.server.broadcast 'comment_channel',content:@comment
    end
  end


 private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, tweet_id: params[:tweet_id])
   end
end