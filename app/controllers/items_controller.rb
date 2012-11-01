class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_order
  before_filter :find_item, only: [:edit, :update]

  def new
    @item = @order.items.build
  end

  def create
    @item = @order.items.build(item_params)
    @item.user = current_user

    if @item.save
      redirect_to orders_path(@order), notice: 'Can\'t wait!'
    else
      render action: :new
    end
  end

  def update
    if @item.update_attributes(item_params)
      redirect_to orders_path(@order), notice: 'Can\'t wait!'
    else
      render action: :edit
    end
  end


  private


  def find_order
    @order = Order.find(params[:order_id])
  end

  def find_item
    @item = current_user.items.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end