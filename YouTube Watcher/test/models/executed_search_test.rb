# == Schema Information
#
# Table name: executed_searches
#
#  id                 :integer          not null, primary key
#  youtube_search_id  :integer
#  triggered_by       :integer
#  started_at         :datetime
#  finished_at        :datetime
#  checked_for_alerts :boolean
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#

require 'test_helper'

class ExecutedSearchTest < ActiveSupport::TestCase
  def setup
    @yts = youtube_searches(:farmall_tractors)
  end

  test 'defaults get set correctly' do
    es = ExecutedSearch.new
    es.youtube_search_id = @yts.id
    assert es.save
    refute es.triggered_by.nil?
    refute es.checked_for_alerts.nil?
  end

  test 'virtual attribute assignment works' do
    es = ExecutedSearch.new( is_ad_hoc: false )
    refute es.ad_hoc_query?
    assert es.scheduled_query?
    es.is_ad_hoc = true
    assert es.ad_hoc_query?
    refute es.scheduled_query?
    es.is_ad_hoc = false
    refute es.ad_hoc_query?
    assert es.scheduled_query?
  end

  test 'compare_to returns an array of video objects' do
    search_a = executed_searches(:set_a)
    search_b = executed_searches(:set_b)
    delta = search_a.compare_to(search_b)
    assert delta.respond_to?(:count)
    assert delta.respond_to?(:first)
    assert delta.first.instance_of?(Video)
  end

  test 'compare_to handles two distinct sets of videos' do
    search_a = executed_searches(:set_a)
    search_b = executed_searches(:set_b)
    delta = search_a.compare_to(search_b)
    assert delta.count > 0
    assert delta == search_a.videos
  end

  test 'compare_to handles two identical sets of videos' do
    search_a = executed_searches(:set_a)
    search_b = executed_searches(:set_a)
    delta = search_a.compare_to(search_b)
    assert delta.count == 0
  end

  test 'compare_to handles intersecting sets of videos' do
    search_a = executed_searches(:set_a)
    search_b = executed_searches(:set_b)
    orig_set_a_size = search_a.videos.count
    orig_set_b_size = search_b.videos.count

    # need to create a copy of a video in both sets
    v = search_b.videos.first
    v2 = Video.create(v.attributes.except('executed_search_id', 'id'))
    search_a.videos << v2

    delta = search_a.compare_to(search_b)

    # size of the delta should still be the original search_a set size
    assert delta.count == orig_set_a_size
    # but the overall set size should have grown by one
    assert search_a.videos.count == (orig_set_a_size + 1)

    # now flip the comparison around
    delta = search_b.compare_to(search_a)

    # size of the delta should the original search_b set size - 1
    # since we duplicated one of the videos over to set a
    assert delta.count == orig_set_b_size - 1
    # but the overall set size should NOT have grown by one
    assert search_b.videos.count == orig_set_b_size

  end

end
