class TranslationsController < ApplicationController
  resource_controller
  actions :all, :except => [:new, :create]

  update.wants.html { redirect_to translations_path }

  def clean
    Translation.not_translated.destroy_all
    redirect_to translations_path
  end
end
