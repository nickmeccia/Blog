module PostsHelper

  def ohs_title title
    title.gsub("o", "<span class=\"red_o\">o</span>").html_safe
  end

  def ohs_date date
    date.gsub("0", "<span class=\"red_o\">0</span>").html_safe
  end
end
