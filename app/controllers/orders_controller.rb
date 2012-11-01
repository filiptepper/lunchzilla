class OrdersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.current
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user

    if @order.save
      redirect_to action: :index, notice: "All done!"
    else
      render action: :new
    end
  end

  def update
    if @order.update_attributes(order_params)
      redirect_to action: :index, notice: "All done!"
    else
      render action: :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to action: :index, notice: "All gone! :("
  end


  private


  def find_order
    @order = Order.find(params[:id])
  end

  def order_params
    params.require(:order).permit(:place)
  end
end