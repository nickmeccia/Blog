class Post < ActiveRecord::Base
  
#  has_attached_file :photo,
 #   :storage => :s3,
  #  :s3_credentials => "#{RAILS_ROOT}/config/s3.yml",
   # :path => ":attachment/:id/:style.:extension",
    #:bucket => '8th_Light_Blog'

    has_attached_file :photo, 
                      #...
                      :storage        => :s3, 
                      :bucket         => '8th_Light_Blog',
                      :s3_credentials => { :access_key_id     => "AKIAJI27ZNCVLTZCWKQQ", 
                                           :secret_access_key => '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' }
    
    
  def last_title_line
    case title_words.length
    when 1
      ""
    when 2
      make_last_line if title_words.last.length + title_words[-2].length < 15
    else
      make_last_line
    end
  end

  def first_title_line
    title.sub(/#{last_title_line}$/, "").strip
  end
    
  private ###############
  
  def make_last_line
    if title_words.last.length < 6
      return "#{title_words[-2]} #{title_words.last}"
    else
      return title_words.last
    end
  end
  
  def title_words
    title.split
  end
  
end
