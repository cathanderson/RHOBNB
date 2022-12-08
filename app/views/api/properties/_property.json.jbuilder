json.extract! property,  
            :id,
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
            :host_id  

if property.photos.length != 0  
    json.photoUrls property.photos.map{|file| url_for(file)}
end  
