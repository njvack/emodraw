class AdminController < ApplicationController
  # Everything in the :admin namespace should inherit from this guy
  # Pretty much, it requires authentication
  before_action :authenticate_admin!
end