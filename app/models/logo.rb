class Logo < ActiveRecord::Base
  def vote!
    increment! :votes_count
  end
end
