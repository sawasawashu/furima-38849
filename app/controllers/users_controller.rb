class UsersController < ApplicationController

  before_action :authenticate_user!, only: :show

  def show
    @user =  User.find(params[:id])
    @nickname = @user.nickname
    @items = @user.items.order('created_at DESC')
    @comment = Comment.new
  end

end
