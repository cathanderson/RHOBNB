class Reservation < ApplicationRecord

    validates :guest_id, :property_id, :check_in_date, :check_out_date, :num_guests, presence: true

    belongs_to :guest,
        foreign_key: :guest_id,
        class_name: :User

    belongs_to :property,
        foreign_key: :property_id,
        class_name: :Property
        
end