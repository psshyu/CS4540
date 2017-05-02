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
class Audit < ApplicationRecord
  enum category: [:auto_search, :manual_search, :exception, :info]
  enum severity: [:high, :medium, :low]

  scope :most_recent, ->(n) { order('audits.created_at desc').limit(n) }
end
