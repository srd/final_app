module ApplicationHelper

  def title
    base_title = "Welcome to Likes Diary"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end

end
