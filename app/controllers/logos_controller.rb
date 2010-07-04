class LogosController < ApplicationController
  resource_controller
  actions :index

  def vote
    object.vote!
    redirect_to logos_path
  end
end