class Admin::BaseController < ApplicationController
  before_action :authenticate_admin!
  protect_from_forgery with: :exception
  layout 'admin/layouts/application'
end
