module PostsHelper

  def ohs_top title
    title.gsub("o", "</h1><h3>o</h3><h1>").html_safe
  end

  def ohs_bottom title
    title.gsub("o", "</h2><h3>o</h3><h2>").html_safe
  end
end
