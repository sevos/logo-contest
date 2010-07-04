class Logo < ActiveRecord::Base
  has_attached_file :image
  
  def vote!
    increment! :votes_count
  end
end
