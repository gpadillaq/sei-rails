class SurveyResultsController < BaseController
  # GET /survey_results/new
  def new
    @survey_result = SurveyResult.new
  end

  # POST /survey_results
  # POST /survey_results.json
  def create
    respond_to do |format|
      if Survey.save_survey_results(params[:survey_results].to_a, params[:survey_comments].to_a, current_user)
         format.html do
           sign_out_and_redirect current_user
         end
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_result_params
      params.require(:survey_result)
            .permit(:user_survey_id, :question_id, :answer_id, :q)
    end
end
