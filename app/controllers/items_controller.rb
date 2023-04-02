class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @article.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def item_params
    params.require(:name, :description, :category_id, :price, :item).permit(:image).merge(user_id: current_user.id)
  end
end
