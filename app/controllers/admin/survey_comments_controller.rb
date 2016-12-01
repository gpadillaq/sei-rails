class Admin::SurveyCommentsController < Admin::BaseController
  before_action :set_survey_comment, only: [:show, :edit, :update, :destroy]

  # GET /survey_comments
  # GET /survey_comments.json
  def index
    respond_to do |format|
      @q = SurveyComment.ransack(params[:q])
      format.html do
        @survey_comments = @q.result(distinct: true)
      end
      format.xlsx do
        @survey_comments = @q.result(distinct: true)
      end
    end
  end

  # GET /survey_comments/1
  # GET /survey_comments/1.json
  def show
  end

  # GET /survey_comments/new
  def new
    @survey_comment = SurveyComment.new
  end

  # GET /survey_comments/1/edit
  def edit
  end

  # POST /survey_comments
  # POST /survey_comments.json
  def create
    @survey_comment = SurveyComment.new(survey_comment_params)

    respond_to do |format|
      if @survey_comment.save
        format.html { redirect_to @survey_comment, notice: 'Survey comment was successfully created.' }
        format.json { render :show, status: :created, location: @survey_comment }
      else
        format.html { render :new }
        format.json { render json: @survey_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /survey_comments/1
  # PATCH/PUT /survey_comments/1.json
  def update
    respond_to do |format|
      if @survey_comment.update(survey_comment_params)
        format.html { redirect_to @survey_comment, notice: 'Survey comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @survey_comment }
      else
        format.html { render :edit }
        format.json { render json: @survey_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /survey_comments/1
  # DELETE /survey_comments/1.json
  def destroy
    @survey_comment.destroy
    respond_to do |format|
      format.html { redirect_to survey_comments_url, notice: 'Survey comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_survey_comment
      @survey_comment = SurveyComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_comment_params
      params.require(:survey_comment).permit(:user_survey_id, :descripcion)
    end
end
