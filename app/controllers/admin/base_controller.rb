class Admin::BaseController < ApplicationController
  # protect_from_forgery with: :exception
  layout 'admin/layouts/application'
  before_action :authenticate_admin!
end
