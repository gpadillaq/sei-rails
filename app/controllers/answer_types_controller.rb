class AnswerTypesController < ApplicationController
  before_action :set_answer_type, only: [:show, :edit, :update, :destroy]

  # GET /answer_types
  # GET /answer_types.json
  def index
    @answer_types = AnswerType.all
  end

  # GET /answer_types/1
  # GET /answer_types/1.json
  def show
  end

  # GET /answer_types/new
  def new
    @answer_type = AnswerType.new
  end

  # GET /answer_types/1/edit
  def edit
  end

  # POST /answer_types
  # POST /answer_types.json
  def create
    @answer_type = AnswerType.new(answer_type_params)

    respond_to do |format|
      if @answer_type.save
        format.html { redirect_to @answer_type, notice: 'Answer type was successfully created.' }
        format.json { render :show, status: :created, location: @answer_type }
      else
        format.html { render :new }
        format.json { render json: @answer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /answer_types/1
  # PATCH/PUT /answer_types/1.json
  def update
    respond_to do |format|
      if @answer_type.update(answer_type_params)
        format.html { redirect_to @answer_type, notice: 'Answer type was successfully updated.' }
        format.json { render :show, status: :ok, location: @answer_type }
      else
        format.html { render :edit }
        format.json { render json: @answer_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /answer_types/1
  # DELETE /answer_types/1.json
  def destroy
    @answer_type.destroy
    respond_to do |format|
      format.html { redirect_to answer_types_url, notice: 'Answer type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_answer_type
      @answer_type = AnswerType.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def answer_type_params
      params.require(:answer_type).permit(:descripcion, :scala)
    end
end
