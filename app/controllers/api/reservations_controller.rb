class Api::ReservationsController < ApplicationController
    wrap_parameters include: Reservation.attribute_names

    def index
        @reservations = Reservation.all
    end

    def show
        @reservation = Reservation.find(params[:id])
    end

    def create
    end

    def update
    end

    def delete
    end
    
end