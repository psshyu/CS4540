# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  admin           :boolean
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  txt_number      :string
#  verified        :boolean          default(FALSE)
#  password_digest :string
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

class User < ApplicationRecord
  has_many :alerts
  has_many :youtube_searches
  has_many :executed_searches, through: :youtube_searches

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :first_name, presence: true, length: { maximum: 50 }
  validates :last_name, presence: true, length: { maximum: 50 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }, if: proc { |user| user.new_record? }

  before_save { email.downcase! }

  has_secure_password
  # requires password_digest:string in the table...this doesn't happen
  # automatically...you need to write a migration to add this field

  # TODO:  define an enumerated type of attribute for delivery_preference


  def full_name
    "#{first_name} #{last_name}".strip
  end

  # see Hartl for why we need this...
  def self.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST : BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end
end
