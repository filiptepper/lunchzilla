class ItemsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_order

  def new
    @item = @order.items.build
  end

  def create
    @item = @order.items.build(item_params)
    @item.user = current_user

    if @item.save
      redirect_to orders_path(@order), notice: "Can't wait!"
    else
      render action: :new
    end
  end


  private


  def find_order
    @order = Order.find(params[:order_id])
  end

  def item_params
    params.require(:item).permit(:name)
  end
end