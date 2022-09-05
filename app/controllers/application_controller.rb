class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def after_sign_in_path_for(_user) # resource_name, could be anything, relevant
    # if you have different types of users, is an instance of user. underscore is for not used anyore
    # this function always takes a paramter. Devise will always need the paramter for this method.
    dashboard_path
  end
end
