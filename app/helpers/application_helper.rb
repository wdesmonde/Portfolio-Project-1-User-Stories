module ApplicationHelper

  #  Allows setting the value to show in an HTML select
  #  param:  attribute, e.g., @story.priority
  #  param:  default_value, what to show if no value exists for
  #     and instantiation 
  def options_default(attribute, default_value)
    if attribute
       return attribute
    else 
       return default_value
    end
  end


# from comments to railscast
  def tag_cloud(tags, classes)
    max = 0
    tags.each do |t|
      if t.count.to_i > max
        max = t.count.to_i
      end 
    end
    tags.each do |tag|
      index = tag.count.to_f / max * (classes.size - 1)
      yield(tag, classes[index.round])
    end
  end 
end
