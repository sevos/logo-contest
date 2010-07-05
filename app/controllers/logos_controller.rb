class LogosController < ApplicationController
  resource_controller
  actions :index, :show, :vote, :winner
  before_filter :check_if_not_voted, :except => [:show, :winner]

  def vote
    object.vote!
    cookies[:voted_logo_id] = object.id
    
    redirect_to logo_path(object)
  end

  def winner
    @winner = Logo.find(:first, :order => "votes_count DESC")
  end

  
  private
  def check_if_not_voted
    if cookies[:voted_logo_id] and Logo.count(:conditions => {:id => cookies[:voted_logo_id]}) > 0
      redirect_to logo_path(cookies[:voted_logo_id])
    end
  end
end
