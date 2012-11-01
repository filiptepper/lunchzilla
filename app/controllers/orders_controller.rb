class OrdersController < ApplicationController
  before_filter :authenticate_user!

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

  def show
    @order = Order.find(params[:id])
  end


  private


  def order_params
    params.require(:order).permit(:place)
  end
end