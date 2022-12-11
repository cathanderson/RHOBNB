class Api::ReservationsController < ApplicationController
    wrap_parameters include: Reservation.attribute_names

    def index
        @reservations = Reservation.all.where(guest_id: current_user.id)
        render :index
    end

    def show
        @reservation = Reservation.find(params[:id])
        render :show
    end

    def create
        @reservation = Reservation.new(reservation_params)

        if @reservation.save
            render :show
        else 
            render json: { errors: @reservation.errors.full_messages }, status: :unprocessable_entity
        end
    end

    def update
        debugger
        @reservation = Reservation.find(params[:id])
        if @reservation.update(reservation_params)
            render :show
        else 
            render json: @reservation.errors.full_messages
        end 
    end

    def destroy
        @reservation = Reservation.find(params[:id])
        if @reservation 
            @reservation.destroy 
        else 
            render json: ["Oops! We can't find the reservation you're looking for."], status: 404
        end 
    end

    private

    def reservation_params
        params.require(:reservation).permit(:guest_id, :property_id, :check_in_date, :check_out_date, :num_guests)
    end
    
end