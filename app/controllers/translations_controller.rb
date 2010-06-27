class TranslationsController < ApplicationController
  resource_controller
  actions :all, :except => [:new, :create]

  update.wants.html { redirect_to translations_path }
end
