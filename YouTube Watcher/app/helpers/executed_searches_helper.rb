module ExecutedSearchesHelper
  def search_type(executed_search_object)
    if executed_search_object.ad_hoc_query?
      content_tag :span, '', class: "glyphicon glyphicon-user"
    elsif executed_search_object.scheduled_query?
      content_tag :span, '', class: "glyphicon glyphicon-flash"
    else
      content_tag :span, '', class: "glyphicon glyphicon-question-sign}"
    end
  end
end
