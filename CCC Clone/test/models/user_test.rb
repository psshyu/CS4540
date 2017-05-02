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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(first_name: 'Jack',
                     last_name: 'Sprat',
                     email: 'jsprat@nurseryrhymes.com')
  end

  test 'valid user is saved' do
    assert @user.valid?
  end

  test 'ensure first name is required' do
    @user.first_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:name], 'no validation error for first_name'
  end

  test 'ensure last name is required' do
    @user.last_name = nil
    refute @user.valid?
    assert_not_nil @user.errors[:name], 'no validation error for last_name'
  end

  test 'full_name() returns combined name' do
    assert @user.full_name == @user.first_name + ' ' + @user.last_name
  end

  test 'ensure email is required' do
    @user.email = nil
    refute @user.valid?
    assert_not_nil @user.errors[:name], 'no requirement check for email'
  end

  test 'ensure email is not too long' do
    @user.email = 'abcdefghijklimnopqrstuvwxyz' * 20
    refute @user.valid?
    assert_not_nil @user.errors[:email], 'no length check for email'
  end

  test 'ensure email is a valid format' do
    @user.email = 'user@example,com'
    refute @user.valid?
    assert_not_nil @user.errors[:email], 'no format check for email'
  end

  test 'ensure email is unique' do
    second_user = @user.dup
    @user.save
    refute second_user.valid?
    assert_not_nil second_user.errors[:email], 'no uniqueness check for email'
  end
  test 'ensure email is lowercase' do
    @user.email = 'USER@EMAIL.COM'
    assert @user.valid?
    @user.save
    assert @user.email == 'user@email.com'
  end
end
