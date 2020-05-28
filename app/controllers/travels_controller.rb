class TravelsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]

    def index
        @travels = Travel.all
    end

    def new
        @travel = Travel.new
    end

    def create 
        current_user.travels.create(travel_params)
        redirect_to root_path
    end

    def show
        @travel = Travel.find(params[:id])
    end

    def edit
        @travel = Travel.find(params[:id])
    end

    def update
        @travel = Travel.find(params[:id])
        @travel.update_attributes(travel_params)
        redirect_to root_path
    end

    def destroy
        @travel = Travel.find(params[:id])
        @travel.destroy
        redirect_to root_path
    end

    private

    def travel_params
        params.require(:travel).permit(:name, :description, :address)
    end
end
