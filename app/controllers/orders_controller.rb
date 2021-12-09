class OrdersController < ApplicationController

    def index
        @orders=current_user.orders
    end

    def show 
        @order=current_user.orders.find(params[:id])
        @product=Product.find_by id: @order.product_id
    end

    def create
        @order=current_user.orders.new(create_params)
        @order.save
        @product=Product.find(params[:product_id])
    end

    private
    def create_params
        params.permit(:product_id,:user_id)
    end

end
