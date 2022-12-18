class LabelingsController < ApplicationController
  before_action :set_labeling, only: %i[ show edit update destroy ]

  # GET /labelings or /labelings.json
  def index
    @labelings = Labeling.all
  end

  # GET /labelings/1 or /labelings/1.json
  def show
  end

  # GET /labelings/new
  def new
    @labeling = Labeling.new
  end

  # GET /labelings/1/edit
  def edit
  end

  # POST /labelings or /labelings.json
  def create
    @labeling = Labeling.new(labeling_params)

    respond_to do |format|
      if @labeling.save
        format.html { redirect_to labeling_url(@labeling), notice: "Labeling was successfully created." }
        format.json { render :show, status: :created, location: @labeling }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @labeling.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /labelings/1 or /labelings/1.json
  def update
    respond_to do |format|
      if @labeling.update(labeling_params)
        format.html { redirect_to labeling_url(@labeling), notice: "Labeling was successfully updated." }
        format.json { render :show, status: :ok, location: @labeling }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @labeling.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /labelings/1 or /labelings/1.json
  def destroy
    @labeling.destroy

    respond_to do |format|
      format.html { redirect_to labelings_url, notice: "Labeling was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_labeling
      @labeling = Labeling.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def labeling_params
      params.require(:labeling).permit(:user_id, :label_id, :expense_id)
    end
end
