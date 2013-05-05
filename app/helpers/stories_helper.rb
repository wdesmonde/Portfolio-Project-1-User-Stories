module StoriesHelper

  def tag_link_list (story_param)
    tag_set = story_param.tags.sort_by { |f| f.name }
    tag_set.map { |t| link_to t.name, tag_path(t.name) }.join(', ')
  end
end
