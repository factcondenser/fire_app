class LabelingsController < ApplicationController
  before_action :set_labeling, only: %i[show edit update destroy]

  # GET /labelings
  def index
    @labelings = Labeling.all
  end

  # GET /labelings/1
  def show; end

  # GET /labelings/new
  def new
    @labeling = Labeling.new
  end

  # GET /labelings/1/edit
  def edit; end

  # POST /labelings
  def create
    @labeling = Labeling.new(labeling_params)

    if @labeling.save
      redirect_to labeling_url(@labeling)
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /labelings/1
  def update
    if @labeling.update(labeling_params)
      redirect_to labeling_url(@labeling)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /labelings/1
  def destroy
    @labeling.destroy

    redirect_to labelings_url
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
