class Admin::DashboardController < ApplicationController

  basic_auth_user = ENV["BASIC_AUTH_USER"]
  basic_auth_secret = ENV["BASIC_AUTH_SECRET"]

  http_basic_authenticate_with name: basic_auth_user, password: basic_auth_secret
  
  def show
  end
end
