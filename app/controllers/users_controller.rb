class UsersController < ApplicationController

  def show
    @nickname = current_user.nickname
    @items = current_user.item
  end

end
