class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :destroy]

  def create
    comment = Comment.create(comment_params)
    redirect_to "/items/#{comment.item.id}"
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    @comment.destroy
    redirect_to item_path(@item.id)
  end

  private

  def comment_params
    params.require(:comment).permit(:text, :rate).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def set_comment
    @item = Item.find(params[:item_id])
    @comment = Comment.find(params[:id])
  end

  def move_to_index
    return if current_user == @comment.user

    redirect_to root_path
  end
end
