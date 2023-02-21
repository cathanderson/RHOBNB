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

# class Api::PropertiesController < ApplicationController
#     wrap_parameters include: Property.attribute_names

#     def index
#         possible_franchises = ["rhony", "rhonj", "rhobh", "rhoslc", "rhoa"]

#         if params[:rh_franchise] == nil
#             @properties = Property.all
#         elsif possible_franchises.include?(params[:rh_franchise])
#             @properties = Property.where(rh_franchise: params[:rh_franchise])
#         else
#             @properties = Property.where("lower(host_name) LIKE ?", "%" + params[:rh_franchise].downcase + "%")
#         end
#         render :index
#     end

#     def show
#         @property = Property.find(params[:id])
#     end
# end