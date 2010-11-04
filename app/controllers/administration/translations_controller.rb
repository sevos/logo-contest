class Administration::TranslationsController < Administration::ApplicationController
  resource_controller
  actions :all, :except => [:new, :create]

  before_filter :set_locale

  update.wants.html { redirect_to administration_translations_path(:locale => params[:locale]) }
  destroy.wants.html { redirect_to :back }

  def clean
    Translation.not_translated.for_locale(params[:locale]).destroy_all
    redirect_to administration_translations_path(:locale => params[:locale])
  end

  def index
    @translations = collection
  end

  private
    def collection
      @collection ||= if params[:locale]
        Translation.for_locale(params[:locale])
      else
        super
      end
    end

    def set_locale
      @available_locales = Translation.available_locales
      @current_locale = params[:locale]
    end
end
