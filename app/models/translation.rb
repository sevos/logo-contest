class Translation < ActiveRecord::Base
  default_scope :order => "created_at DESC"
  before_update { |r| r.translated = true }
  after_save { Translation.invalidate_cache }
  after_destroy { Translation.invalidate_cache }

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

  def self.invalidate_cache
    if cache_store = I18n.cache_store
      cache_store.delete_matched(/i18n-.*/)
    end
  end

  def self.available_locales
    self.scoped(:select => "DISTINCT locale", :order => "locale ASC").map(&:locale)
  end
end
