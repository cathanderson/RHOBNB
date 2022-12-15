# == Schema Information
#
# Table name: reviews
#
#  id            :bigint           not null, primary key
#  rating        :integer          not null
#  review        :text             not null
#  review_date   :string
#  reviewer_name :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  guest_id      :integer          not null
#  property_id   :integer          not null
#
# Indexes
#
#  index_reviews_on_guest_id     (guest_id)
#  index_reviews_on_property_id  (property_id)
#
# Foreign Keys
#
#  fk_rails_...  (guest_id => users.id)
#  fk_rails_...  (property_id => properties.id)
#
class Review < ApplicationRecord

    validates :guest_id, :property_id, :rating, :review, presence: true

    belongs_to :guest,
        foreign_key: :guest_id,
        class_name: :User

    belongs_to :property,
        foreign_key: :property_id,
        class_name: :Property

    has_one_attached :photo

        
end
