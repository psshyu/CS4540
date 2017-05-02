module VideoHelper
  def video_stats(v)
    capture do
      content_tag :span, class: 'stats' do
        concat generate_stat(v.view_count, 'eye-open')
        concat generate_stat(v.comment_count, 'comment')
        concat generate_stat(v.like_count, 'thumbs-up')
        concat generate_stat(v.dislike_count, 'thumbs-down')
        concat generate_stat(v.favorite_count, 'heart')
      end
    end
  end

  def channel(v)
    content_tag :span, v.channel_name, class: 'channel-name'
  end

  def generate_stat(num, str)
    capture do
      content_tag :div, class: 'stat panel panel-default' do
        concat content_tag :span, num, class: 'stat-value'
        concat content_tag :span, '', class: "glyphicon glyphicon-#{str}"
      end
    end
  end
end
