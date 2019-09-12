class UsersController < ApplicationController
    skip_before_action :authorized, only: [:create]

    def profile
        
        # render json: { user: UserSerializer.new(User.first)}, status: :accepted 
        render json: { user: UserSerializer.new(current_user)}, status: :accepted
    end

    def create
        @user = User.create(user_params)
        if @user.valid?
            @token = encode_token({user_id: @user.id})
            render json: { user: UserSerializer.new(@user), jwt: @token }, status: :created
        else
            render json: { error: 'failed to create user' }, status: :not_acceptable
        end 
    end

    def destroy
        @user = User.find_by(id: params[:id])
        @portfolios = Portfolio.where(user_id: @user.id)
            @portfolios.each do |portfolio|
                @stocks = Stock.where(portfolio_id: portfolio.id)
                @stocks.each do |stock|
                    stock.destroy
                end
                portfolio.destroy
            end
        @user.destroy
    end

    private

    def user_params
        params.require(:user).permit(:username, :password, :name, :email, :image_url, :member_since)
    end

end
