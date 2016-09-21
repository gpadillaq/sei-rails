class SubjectResultsController < ApplicationController
  before_action :set_subject_result, only: [:show, :edit, :update, :destroy]

  # GET /subject_results
  # GET /subject_results.json
  def index
    @subject_results = SubjectResult.all
  end

  # GET /subject_results/1
  # GET /subject_results/1.json
  def show
  end

  # GET /subject_results/new
  def new
    @subject_result = SubjectResult.new
  end

  # GET /subject_results/1/edit
  def edit
  end

  # POST /subject_results
  # POST /subject_results.json
  def create
    @subject_result = SubjectResult.new(subject_result_params)

    respond_to do |format|
      if @subject_result.save
        format.html { redirect_to @subject_result, notice: 'Subject result was successfully created.' }
        format.json { render :show, status: :created, location: @subject_result }
      else
        format.html { render :new }
        format.json { render json: @subject_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_results/1
  # PATCH/PUT /subject_results/1.json
  def update
    respond_to do |format|
      if @subject_result.update(subject_result_params)
        format.html { redirect_to @subject_result, notice: 'Subject result was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_result }
      else
        format.html { render :edit }
        format.json { render json: @subject_result.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_results/1
  # DELETE /subject_results/1.json
  def destroy
    @subject_result.destroy
    respond_to do |format|
      format.html { redirect_to subject_results_url, notice: 'Subject result was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_result
      @subject_result = SubjectResult.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_result_params
      params.require(:subject_result).permit(:user_survey_id, :question_id, :answer_id)
    end
end
