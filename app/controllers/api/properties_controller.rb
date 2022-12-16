class Api::PropertiesController < ApplicationController
    wrap_parameters include: Property.attribute_names

    def index
        if params[:rh_franchise] == nil
            @properties = Property.all
        else
            @properties = Property.where(rh_franchise: params[:rh_franchise])
        end
        render :index
    end

    def show
        @property = Property.find(params[:id])
    end
end