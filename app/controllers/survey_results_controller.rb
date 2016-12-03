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

  def docente
    data = Survey.docente_survey(params[:survey_results].to_a, current_user)
    files = Array.new
    data.each_with_index do |d, i|
      file_name = "sei_#{current_user.display_name}_#{Time.current.to_i}#{i}".dehumanize
      files.push({path: PDFGenerator::Generator.get_pdf(d, "docente", file_name)[:data], name: file_name})
    end
    UserMailer.docente_email(current_user, files).deliver_now
    sign_out_and_redirect current_user
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def survey_result_params
      params.require(:survey_result)
            .permit(:user_survey_id, :question_id, :answer_id, :q)
    end
end
