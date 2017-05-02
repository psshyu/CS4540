# == Schema Information
#
# Table name: youtube_searchers
#
#  id           :integer          not null, primary key
#  name         :string
#  search_terms :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'test_helper'

class YoutubeSearcherTest < ActiveSupport::TestCase

  test 'alert_on_new_result attribute exists' do
    ys = YoutubeSearch.new
    assert ys.alert_on_new_result.respond_to?(:present?)
    assert [TrueClass, FalseClass].include?(ys.alert_on_new_result.class)
  end

  test 'youtube api query returns results' do
    video_count = Video.count
    @yts = youtube_searches(:farmall_tractors)
    @yts.run!
    assert Video.count > video_count
  end

  test 'an ExecutedSearch object gets associated' do
    @yts = youtube_searches(:farmall_tractors)
    @yts.run!
    refute @yts.executed_searches.blank?
    assert @yts.executed_searches.first.videos.count > 0
  end

  test 'the scheduling has been installed' do
    assert File.exists?(Rails.root + 'config' + 'schedule.rb')
  end

  test 'the scheduling has been configured' do
    lines = File.open(Rails.root + 'config' + 'schedule.rb', 'r').readlines
    slammed = lines.map(&:strip).join(' ')
    r = Regexp.compile('every 2\.hours do runner\s+\\"YoutubeSearch.run_batch!\\" end')
    assert slammed.match(r)
  end

  test 'with_alerting works' do
    s1 = youtube_searches(:farmall_tractors)
    s2 = youtube_searches(:vampires)
    s3 = youtube_searches(:learning_rails)
    s1.save
    s2.save
    s3.save
    assert s1.alert_on_new_result
    assert s2.alert_on_new_result
    refute s3.alert_on_new_result
    assert YoutubeSearch.with_alerting.include?(s1)
    assert YoutubeSearch.with_alerting.include?(s2)
    refute YoutubeSearch.with_alerting.include?(s3)
  end

  test 'run_batch executes all to-be-alerted-on searches' do
    # we need to setup a prior search that will be different than
    # the current one.
    yts = youtube_searches(:farmall_tractors)
    yts.run!
    # now remove some of the results
    es = yts.executed_searches.first
    es.videos.first.delete
    es.videos.first.delete
    es.videos.first.delete

    Alert.delete_all
    orig_alert_count = Alert.count

    # the same query to get back presumably the same results
    yts.run_and_alert!

    # Alert count should be at least the three we removed
    assert (Alert.count >= (orig_alert_count+3))
  end

end
