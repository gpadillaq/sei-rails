class Admin::UserTypesController < Admin::BaseController
  before_action :redirect, except: :index

  # GET /user_types
  # GET /user_types.json
  def index
    @user_types = UserType.all
  end

  def redirect
    redirect_to user_types_url
  end
end
