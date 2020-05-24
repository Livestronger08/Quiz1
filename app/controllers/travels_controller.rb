class TravelsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @travels = Travel.all
    end

    def new
        @travel = Travel.new
    end

    def create 
        current_user.Travel.create(travel_params)
        redirect_to root_path
    end

    def show
        @travel = Travel.find(params[:id])
    end

    private

    def travel_params
        params.require(:travel).permit(:name, :description, :address)
    end
end
