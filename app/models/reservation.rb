# == Schema Information
#
# Table name: reservations
#
#  id             :bigint           not null, primary key
#  check_in_date  :date             not null
#  check_out_date :date             not null
#  num_guests     :integer          not null
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  guest_id       :integer          not null
#  property_id    :integer          not null
#
# Indexes
#
#  index_reservations_on_guest_id     (guest_id)
#  index_reservations_on_property_id  (property_id)
#
# Foreign Keys
#
#  fk_rails_...  (guest_id => users.id)
#  fk_rails_...  (property_id => properties.id)
#
class Reservation < ApplicationRecord

    validates :guest_id, :property_id, :check_in_date, :check_out_date, :num_guests, presence: true

    belongs_to :guest,
        foreign_key: :guest_id,
        class_name: :User

    belongs_to :property,
        foreign_key: :property_id,
        class_name: :Property
        
end
