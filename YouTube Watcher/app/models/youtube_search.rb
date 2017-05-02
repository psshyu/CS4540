# == Schema Information
#
# Table name: youtube_searches
#
#  id                  :integer          not null, primary key
#  name                :string
#  search_terms        :string
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  user_id             :integer
#  alert_on_new_result :boolean          default(FALSE)
#

# A class to manage the searching of Youtube and creation
# of objects to store the results.
class YoutubeSearch < ApplicationRecord
  belongs_to :user
  has_many :executed_searches
  has_many :alerts

  scope :most_recent, ->(n) { order('youtube_searches.created_at desc').limit(n) }

  scope :with_alerting, -> { where('youtube_searches.alert_on_new_result = ?', true) }

  validates :search_terms, presence: true

  MAX_RESULTS = 30

  before_save :set_defaults

  def self.run_and_alert!
    YoutubeSearch.with_alerting.each do |search|
      search.run!(false)  # false means this is not an ad hoc query
      search.check_for_alert_state
    end
    Alert.deliver!
  end

  def run_and_alert!( is_ad_hoc = true )
    run!(is_ad_hoc)
    check_for_alert_state
    Alert.deliver!
  end

  def run!( is_ad_hoc = true )
    # create a linked instance of an executed search to record that
    # this search is being, um, executed
    es = executed_searches.create( is_ad_hoc: is_ad_hoc )
    es.run
  end

  def check_for_alert_state
    # first look for a prior run of this search...and we don't care
    # if that prior run was ad hoc or scheduled.
    #
    # the just-run search results will be the first ExecutedSearch object
    # in the has_many relationship, and the one we want to compare it against
    # will be the second one (if it exists)

    # do we have a prior search?
    return false if self.executed_searches.count == 1

    current_results = self.executed_searches[-1]
    prior_results   = self.executed_searches[-2]

    # are the two result sets different?
    delta = current_results.compare_to(prior_results)
    if delta.count > 0
      # yep!  setup alarms for the different videos
      delta.each do |video|
        # the default attributes for an Alert object set it
        # as generated, not delivered.  We'll deliver later.
        self.alerts.create(message: video.title + ' ' + video.url)
      end
    end
  end

  private

  def set_defaults
    self.name ||= search_terms.truncate(25, separator: ' ')
  end
end
