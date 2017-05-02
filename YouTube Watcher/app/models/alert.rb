# == Schema Information
#
# Table name: alerts
#
#  id                :integer          not null, primary key
#  status            :integer
#  delivered_at      :datetime
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  youtube_search_id :integer
#  criterion         :integer          default("change_in_top_x")
#  message           :string
#  sns_message_id    :string
#

class Alert < ApplicationRecord
  belongs_to :youtube_search
  has_one :user, through: :youtube_search

  scope :most_recently_created, ->(n) { order('alerts.created_at desc').limit(n) }
  scope :most_recently_delivered, ->(n) { order('alerts.delivered_at desc').limit(n) }

  enum status: [:generated, :delivered]
  enum criterion: [:change_in_top_x] # this could grow as we add more alert types

  before_save :set_defaults

  AWS_SNS_TOPIC='arn:aws:sns:us-east-1:415971864575:cs4540_youtube_alert'


  def response

  end

  # scan through the list of alerts for any that haven't been delivered and do so
  def self.deliver!
    Alert.generated.each do |alert|
      alert.deliver!
    end
  end

  # deliver a particular alert based on the user's preferences
  def deliver!
    Rails.logger.info("Delivering an alert to #{user.full_name}: #{self.message}")
    begin
      sns = Aws::SNS::Client.new
      response = sns.publish({
        topic_arn: AWS_SNS_TOPIC,
        message: self.message,
        subject: 'New Youtube Video!'
                             })

      self.sns_message_id = response.message_id
      # change the status flag on the alert
      self.status = 'delivered'
      self.delivered_at = Time.now
      self.save
    rescue Aws::SNS::Errors::ServiceError
      # uh oh..something bad happened in AWS
      raise "AWS Error in publishing SNS message"
    end
  end

  private

  def set_defaults
    self.status ||= 'generated'
    self.criterion ||= 'change_in_top_x'
  end
end
