# == Schema Information
#
# Table name: properties
#
#  id            :bigint           not null, primary key
#  city          :string           not null
#  description   :text             not null
#  host_name     :string           not null
#  lat           :float            not null
#  lng           :float            not null
#  num_baths     :integer          not null
#  num_beds      :integer          not null
#  price         :float            not null
#  property_name :string           not null
#  state         :string           not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  host_id       :integer          not null
#
# Indexes
#
#  index_properties_on_city     (city)
#  index_properties_on_host_id  (host_id)
#  index_properties_on_state    (state)
#
# Foreign Keys
#
#  fk_rails_...  (host_id => users.id)
#
class Property < ApplicationRecord

    validates :city, :description, :host_name, :lat, :lng, :num_baths, :num_beds, :price, :property_name, :state, :host_id, presence: true

    # belongs_to :host,
    #     class_name: :User,
    #     foreign_key: :host_id

    # has_many :reservations,
    #     dependent: :destroy
end
