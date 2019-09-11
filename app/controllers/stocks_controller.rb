class StocksController < ApplicationController
    def create
        @stock = Stock.create(stock_params)
        render json: { user: UserSerializer.new(current_user)}
    end

    def destroy
        @stock = Stock.find_by(id: params[:id])
        @stock.delete
        render json: { user: UserSerializer.new(current_user)}
    end

    private

    def stock_params
        params.require(:stock).permit(:portfolio_id, :name, :ticker, :sector)
    end
end
