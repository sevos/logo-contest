class CustomersController < ApplicationController
  resource_controller
  actions :all, :except => [:show]

  create.wants.html { redirect_to customers_path }
  update.wants.html { redirect_to customers_path }
end
