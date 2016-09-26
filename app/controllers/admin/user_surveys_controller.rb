class Admin::UserSurveysController < Admin::BaseController
  before_action :set_user_survey, only: [:show, :edit, :update, :destroy]

  # GET /user_surveys
  # GET /user_surveys.json
  def index
    @user_surveys = UserSurvey.all
  end

  # GET /user_surveys/1
  # GET /user_surveys/1.json
  def show
  end

  # GET /user_surveys/new
  def new
    @user_survey = UserSurvey.new
  end

  # GET /user_surveys/1/edit
  def edit
  end

  # POST /user_surveys
  # POST /user_surveys.json
  def create
    @user_survey = UserSurvey.new(user_survey_params)

    respond_to do |format|
      if @user_survey.save
        format.html { redirect_to admin_user_survey_path(@user_survey), notice: 'User survey was successfully created.' }
        format.json { render :show, status: :created, location: @user_survey }
      else
        format.html { render :new }
        format.json { render json: @user_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_surveys/1
  # PATCH/PUT /user_surveys/1.json
  def update
    respond_to do |format|
      if @user_survey.update(user_survey_params)
        format.html { redirect_to admin_user_survey_path(@user_survey), notice: 'User survey was successfully updated.' }
        format.json { render :show, status: :ok, location: @user_survey }
      else
        format.html { render :edit }
        format.json { render json: @user_survey.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_surveys/1
  # DELETE /user_surveys/1.json
  def destroy
    @user_survey.destroy
    respond_to do |format|
      format.html { redirect_to user_surveys_url, notice: 'User survey was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_survey
      @user_survey = UserSurvey.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_survey_params
      params.require(:user_survey).permit(:user_id, :user_type_id, :level_id, :group_id, :interval_id, :subject_id, :activa)
    end
end
