class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}"
  end

  def edit
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
  end

  def update
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
