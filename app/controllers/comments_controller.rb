class CommentsController < ApplicationController

  def create
    @comment = Comment.new(text: params[:commnet][:text])
  end

end
