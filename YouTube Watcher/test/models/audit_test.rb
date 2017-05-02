# == Schema Information
#
# Table name: audits
#
#  id         :integer          not null, primary key
#  category   :integer
#  title      :string
#  details    :text
#  severity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'test_helper'

class AuditTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
