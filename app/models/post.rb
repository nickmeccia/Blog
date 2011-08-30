class Post < ActiveRecord::Base
  
  def last_title_line
    
    return if title_words.length == 1
    
    if title_words.length == 2
      if title_words.last.length + title_words[-2].length < 9
        return make_last_line
      else
        return
      end
    end
      
    if title_words.length > 2
      make_last_line
    end
    
  end



  private ###############
  
  def make_last_line
    if title_words.last.length < 4
      return "#{title_words[-2]} #{title_words.last}"
    else
      return title_words.last
    end
  end
  
  
  def title_words
    title.split
  end
end
