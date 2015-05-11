module PostsHelper
  def full_url link
    if link.include?("http://")
      link
    else
      link = "http://" + link
    end
  end
end
