class Administration::ApplicationController < ::ApplicationController
  before_filter :set_controller_and_action_names

  private

  def set_controller_and_action_names
    @current_controller = controller_name
    @current_action     = action_name
  end
end
