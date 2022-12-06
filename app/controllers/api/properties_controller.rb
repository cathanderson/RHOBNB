class Api::PropertiesController < ApplicationController
    wrap_parameters include: Property.attribute_names

    def index
        @properties = Property.all
    end

    def show
        @property = Property.find(params[:id])
    end
    
end