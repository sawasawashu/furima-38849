class UsersController < ApplicationController

  before_action :authenticate_user!, only: :show

  def show
    @nickname = current_user.nickname
    @items = current_user.items.order('created_at DESC')
  end

end
