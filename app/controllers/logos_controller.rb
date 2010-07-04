class LogosController < ApplicationController
  resource_controller
  actions :index

  def vote
    unless cookies[:voted_logo_id]
      object.vote!
      cookies[:voted_logo_id] = object.id
      redirect_to logos_path
    else
      redirect_to logo_path(cookies[:voted_logo_id])
    end
  end
end