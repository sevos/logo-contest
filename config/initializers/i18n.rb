module I18n
  module Backend
    class ActiveRecord
      module Missing
        def store_default_translation(locale, key, interpolations)
          translation = ActiveRecord::Translation.new :locale => locale.to_s, 
                                                      :key => key,
                                                      :value => "#{key} (#{locale.to_s})"
          translation.interpolations = interpolations
          translation.save
        end
      end
    end
  end
end

I18n.backend.send(:extend, I18n::Backend::ActiveRecord::Missing)
I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Cache)
I18n::Backend::ActiveRecord.send(:include, I18n::Backend::Pluralization)
I18n.cache_store = ActionController::Base.cache_store
I18n.backend = I18n::Backend::Chain.new(I18n::Backend::ActiveRecord.new, I18n.backend)