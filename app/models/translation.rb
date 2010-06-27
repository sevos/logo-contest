class Translation < ActiveRecord::Base
  default_scope :order => "created_at DESC"
  before_update { |r| r.translated = true }

  named_scope :not_translated, :conditions => {:translated => false}
end
