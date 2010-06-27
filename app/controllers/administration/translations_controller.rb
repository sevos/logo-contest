class Administration::TranslationsController < Administration::ApplicationController
  resource_controller
  actions :all, :except => [:new, :create]

  update.wants.html { redirect_to administration_translations_path }

  def clean
    Translation.not_translated.destroy_all
    redirect_to administration_translations_path
  end
end
