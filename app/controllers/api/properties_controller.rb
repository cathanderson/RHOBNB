class Api::PropertiesController < ApplicationController
    wrap_parameters include: Property.attribute_names

    def index
        if params[:rh_franchise] == nil
            @properties = Property.all
        else
            @properties = Property.select(:id,
            :city,
            :description,
            :host_name,
            :lat,
            :lng,
            :num_baths,
            :num_beds,
            :price,
            :property_name,
            :state,
            :host_id,
            :rh_franchise).where(rh_franchise: params[:rh_franchise])
            # debugger
        end
        render :index
    end


    def show
        @property = Property.find(params[:id])
    end
    
end