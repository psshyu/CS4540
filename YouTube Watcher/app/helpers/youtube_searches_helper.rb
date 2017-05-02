module YoutubeSearchesHelper

  def alert_glyph(search_object)
    if search_object.alert_on_new_result
      content_tag :span, '', class: "glyphicon glyphicon-volume-up"
    else
      content_tag :span, '', class: "glyphicon glyphicon-volume-off"
    end
  end

end
