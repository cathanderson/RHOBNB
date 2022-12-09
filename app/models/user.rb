# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :string           not null
#  rh_franchise    :string
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_users_on_email          (email) UNIQUE
#  index_users_on_rh_franchise   (rh_franchise)
#  index_users_on_session_token  (session_token) UNIQUE
#
class User < ApplicationRecord

  has_secure_password # handles password= and is_password?

  before_validation :ensure_session_token

  validates :email, :first_name, :last_name, :password_digest, :session_token, presence: true
  validates :email, :session_token, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, length: { minimum: 8 }, allow_nil: true

  # MUST FINISH THESE BEFORE COMMENTING IN

  has_one_attached :photo

  has_many :reservations,
    dependent: :destroy

  has_many :properties,
    class_name: :Property,
    foreign_key: :host_id,
    dependent: :destroy
    
  # has_many :reviews,
  #     dependent: :destroy

  def self.find_by_credentials(email, password)
    user = User.find_by(email: email)

    if user&.authenticate(password) # user && user.authenticate(password)
      return user
    else
      nil
    end
  end

  def ensure_session_token
    self.session_token ||= generate_unique_session_token
  end

  def reset_session_token!
    self.session_token = generate_unique_session_token
    save!
    session_token
  end

  private

  def generate_unique_session_token
    # debugger
    while true
      token = SecureRandom.urlsafe_base64
      return token unless User.exists?(session_token: token)
    end
  end
end
