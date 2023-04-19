class ItemsController < ApplicationController

  before_action :move_to_login, except: :index

  def index
  end

  def new
    @item = Item.new
  end

  private

  def move_to_login
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
