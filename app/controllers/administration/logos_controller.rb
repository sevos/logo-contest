class Administration::LogosController < Administration::ApplicationController
  resource_controller

  create.wants.html { redirect_to administration_logos_path }
  update.wants.html { redirect_to administration_logos_path }

end