class SubjectCommentsController < ApplicationController
  before_action :set_subject_comment, only: [:show, :edit, :update, :destroy]

  # GET /subject_comments
  # GET /subject_comments.json
  def index
    @subject_comments = SubjectComment.all
  end

  # GET /subject_comments/1
  # GET /subject_comments/1.json
  def show
  end

  # GET /subject_comments/new
  def new
    @subject_comment = SubjectComment.new
  end

  # GET /subject_comments/1/edit
  def edit
  end

  # POST /subject_comments
  # POST /subject_comments.json
  def create
    @subject_comment = SubjectComment.new(subject_comment_params)

    respond_to do |format|
      if @subject_comment.save
        format.html { redirect_to @subject_comment, notice: 'Subject comment was successfully created.' }
        format.json { render :show, status: :created, location: @subject_comment }
      else
        format.html { render :new }
        format.json { render json: @subject_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_comments/1
  # PATCH/PUT /subject_comments/1.json
  def update
    respond_to do |format|
      if @subject_comment.update(subject_comment_params)
        format.html { redirect_to @subject_comment, notice: 'Subject comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_comment }
      else
        format.html { render :edit }
        format.json { render json: @subject_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_comments/1
  # DELETE /subject_comments/1.json
  def destroy
    @subject_comment.destroy
    respond_to do |format|
      format.html { redirect_to subject_comments_url, notice: 'Subject comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_comment
      @subject_comment = SubjectComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_comment_params
      params.require(:subject_comment).permit(:user_survey_id, :descripcion)
    end
end
