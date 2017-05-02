# == Schema Information
#
# Table name: users
#
#  id         :integer          not null, primary key
#  first_name :string
#  last_name  :string
#  email      :string
#  admin      :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_users_on_email  (email) UNIQUE
#

# Verifies data
class User < ApplicationRecord
  before_validation :ensure_email_is_lowercase
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :email
  validates_uniqueness_of :email
  validates :email, length: { maximum: 520 }
  validates_format_of :email,
                      with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
  def full_name
    first_name + ' ' + last_name
  end

  def ensure_email_is_lowercase
    email.nil? || email.downcase!
  end
end
