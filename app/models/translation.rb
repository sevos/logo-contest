class Translation < ActiveRecord::Base
  include I18n::Backend::Cache
  
  default_scope :order => "created_at DESC"
  before_update { |r| r.translated = true }
  after_save { I18n.cache_invalidate! }
  after_destroy { I18n.cache_invalidate! }

  named_scope :not_translated, :conditions => {:translated => false}
  named_scope :for_locale, lambda { |locale|
    if locale
      {
        :conditions => {:locale => locale.to_s}
      }
    else
      {}
    end
  }

  def self.available_locales
    self.scoped(:select => "DISTINCT locale", :order => "locale ASC").map(&:locale)
  end
end
